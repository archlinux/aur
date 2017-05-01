# Maintainer: Jesse McClure AKA "Trilby" <jesse [dot] mcclure [at] umassmed [dot] edu>
_gitname="goldy-gopher"
pkgname="${_gitname}-git"
pkgver=0
pkgrel=1
pkgdesc="A simple gopher client and server"
url="https://github.com/TrilbyWhite/goldy-gopher"
source=("git+https://github.com/TrilbyWhite/${_gitname}.git")
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('git')
depends=('file' 'libedit')
source=("git+https://github.com/TrilbyWhite/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}";
	echo "0.$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
	cd "${_gitname}"
	make PREFIX=/usr
}

package() {
	cd "${_gitname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
