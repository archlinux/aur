# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=kfilebox-qt5-git
_pkgname=kfilebox
pkgrel=1
pkgver=r130.5294287
pkgdesc="KDE Dropbox client with own daemon (Qt5 branch)"
arch=('i686' 'x86_64')
url="https://github.com/marcpayne/kfilebox"
license=('GPL')
depends=('knotifications' 'ki18n' 'hicolor-icon-theme')
makedepends=('git' 'cmake>2.8.12' 'extra-cmake-modules')
provides=('dropbox')
conflicts=('kfilebox')
source=(git+https://github.com/marcpayne/kfilebox.git#branch=qt5-kf5-port)
install=${_pkgname}.install
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p ${_pkgname}/build
}
        
build() {
    cd ${_pkgname}/build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd ${_pkgname}/build
	make DESTDIR=${pkgdir} install
	# instal missing icon
	install -Dm644 "${srcdir}"/${_pkgname}/img/${_pkgname}.png "${pkgdir}"/usr/share/${_pkgname}/${_pkgname}.png
}
