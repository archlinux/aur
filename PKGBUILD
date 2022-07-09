# Maintainer : Colin Arnott <arnottcr@gmail.com>
# Maintainer : Björn Bidar <bjorn.bidar@thaodan.de>
# Contributer : Jo De Boeck <deboeck.jo@gmail.com>

pkgname=purple-skypeweb-git
pkgver=1.7.r18.g8b29d7b
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="SkypeWeb Plugin for Pidgin"
url="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
depends=('libpurple' 'json-glib')
makedepends=('git' 'cmake')
conflicts=('purple-skypeweb' 'skype4pidgin')
provides=('purple-skypeweb')

source=("$pkgname"::'git+https://github.com/EionRobb/skype4pidgin')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "$srcdir/$pkgname/skypeweb" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
