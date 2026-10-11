# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=atif-1402
_gitname=parse
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Make messy Linux command output readable"

pkgver=0.2.0
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
sha256sums=('5c1be365d78ccd08f79ef88a516c663d77f750c7605b767791f1159ee943446d')


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
