# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Andrew Querol <andrew@querol.me>
pkgname=chrome-gnome-shell
pkgver=9
pkgrel=1
pkgdesc="Native connector for integration with extensions.gnome.org"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/GnomeShellIntegrationForChrome"
license=('GPL')
depends=('gnome-shell' 'python' 'python-requests' 'python-gobject')
makedepends=('git' 'cmake' 'jq')
provides=("$pkgname")
replaces=('gs-chrome-connector') # Old name
conflicts=("${replaces[0]}" "${pkgname}-git")
source=("git+https://git.gnome.org/browse/chrome-gnome-shell#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    mkdir -p 'build'
}

build() {
    cd "$srcdir/$pkgname/build"
    cmake                                \
        -DCMAKE_INSTALL_PREFIX=/usr      \
        -DCMAKE_INSTALL_LIBDIR=lib       \
        -DBUILD_EXTENSION=OFF ../
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install
}
