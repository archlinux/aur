# Maintainer: Bertrand Bonnefoy-Claudet <bertrandbc@gmail.com>

pkgname=connman-ui-git
pkgver=r33.1e1fd69
pkgrel=1
pkgdesc="A full-featured GTK based trayicon UI for ConnMan (git version)"
arch=('i686' 'x86_64')
url="https://github.com/tbursztyka/connman-ui"
license=('GPL2')
depends=('connman' 'gtk3')
makedepends=('git' 'intltool')
source=("git+https://github.com/tbursztyka/connman-ui.git")
md5sums=('SKIP')

_gitroot="connman-ui"

pkgver() {
    cd "$srcdir/$_gitroot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitroot"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
