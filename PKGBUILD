# Maintainer: Louis Holbrook <dev@holbrook.no>
pkgname=go-swarm
pkgver=0.4.3
pkgrel=1
epoch=
pkgdesc="Censorship resistant storage and communication infrastructure for a truly sovereign digital society"
arch=('x86_64')
url="https://swarm.ethereum.org"
license=('LGPL3')
groups=()
depends=()
makedepends=('go>=1.10.0' 'git')
checkdepends=()
optdepends=('openssl')
provides=('go-swarm')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/ethersphere/swarm/archive/v${pkgver}.tar.gz" "v${pkgver}.tar.gz.sig")
noextract=()
md5sums=("7f394b218657463761a555d5c598a320" "SKIP");
validpgpkeys=("0826EDA1702D1E87C6E2875121D2E7BB88C2A746")

prepare() {
	export GOPATH=${srcdir}/go
	export SWARMPATH=${GOPATH}/src/github.com/ethersphere
	if [ -d "$GOPATH" ]; then
		rm -vrf "$GOPATH"
	fi
	if [ ! -d "${srcdir}/build" ]; then
		mkdir -vp "${srcdir}/build"
	fi
	if [ ! -d "$SWARMPATH" ]; then
		mkdir -vp "$SWARMPATH"
	fi
	mv -v ${srcdir}/swarm-${pkgver} ${SWARMPATH}/swarm
}

build() {
	msg "Building the swarm binary"
	msg2 "using gopath $GOPATH"
	go build -o build/swarm -v ${SWARMPATH}/swarm/cmd/swarm
}

check() {
	warning "still need to add checks"
}

package() {
	install -v -D -m0755 build/swarm ${pkgdir}/usr/local/bin/swarm
}
