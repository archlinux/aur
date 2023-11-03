# Maintainer: blek! <me@blek.codes>
pkgname=bfile-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='The blek! File CLI'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url='https://git.blek.codes/blek/bfile_cli'
provides=('bfile-cli')
conflicts=('bfile-cli')
options=(!lto)
license=('GPL3')
depends=(
  'pacman>5'
  'git'
)
makedepends=('go>=1.21.3')
source=("${pkgname}-${pkgver}.tar.gz::https://git.blek.codes/blek/bfile_cli/archive/${pkgver}.tar.gz")
sha256sums=('470022e1a77a0fbd864c251cb3bbab45c568a3f7985643e3b39add5f4299b31a')

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_ENABLED=1

	cd "${srcdir}/bfile_cli"
	go build .
}

package() {
	cd "${srcdir}/bfile_cli"
	install -Dm755 bfile_cli "${pkgdir}/usr/bin/bfile_cli"
}
