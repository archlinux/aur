__pkgname="deadbeef-plugin-statusnotifier"
__gitroot="github.com/vovochka404/deadbeef-statusnotifier-plugin"
pkgname=${__pkgname}-git
pkgver=r35.aeb0626
pkgrel=2
pkgdesc="StatusNotifier plugin for the DeaDBeeF music player replaces default tray icon on DE that supports StatusNotifierIitem protocol."
url="https://${__gitroot}"
arch=('i686' 'x86_64')
license=('GPL3')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("$pkgname::git+https://${__gitroot}")
depends=('deadbeef' 'gtk3' 'libdbusmenu-glib')
makedepends=('cmake' 'git')
md5sums=('SKIP')

build() {
    cmake "${srcdir}/${pkgname}" -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DUSE_GTK=OFF -DUSE_GTK3=ON
    make
}


package() {
    cd "${srcdir}" && make install
}


pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

