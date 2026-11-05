# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=atif-1402
_gitname=parse
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Make messy Linux command output readable"

pkgver=0.2.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('go')
provides=("${_appname}")

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4d980e723e512f0d3848a749ff86b491d4762da01cd98e80f93559561aa325fc')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	export CGO_ENABLED=0
	go build -v -trimpath -o "${pkgname}" ./
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	export GOPROXY=off
	go test -v ./...
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
