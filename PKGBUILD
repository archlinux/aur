# Maintainer: Andrei Embarque <andreijosee@zoho.com>

_pkgname='xwinwrap'
pkgname="${_pkgname}-mmhobi7-git"
pkgver=r30.391519d
pkgrel=1
pkgdesc="X11 Window in desktop enviroment background (mmhobi7 fork)"
arch=('x86_64')
url="https://github.com/mmhobi7/xwinwrap"
depends=('libx11' 'libxrender' 'libxext')
makedepends=('git')
provides=('xwinwrap')
conflicts=('xwinwrap')
source=("https://github.com/mmhobi7/xwinwrap.git")
sha256sums=('SKIP')

prepare() {
    git clone --single-branch --branch master https://github.com/mmhobi7/xwinwrap.git ${pkgname}
}

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
	make
}

package() {
    cd "${pkgname}"
	make DESTDIR="$pkgdir" install
}
