# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=anymeal-git
pkgver=r$(git ls-remote https://github.com/wedesoft/anymeal.git HEAD | cut -c1-7)
pkgrel=1
pkgdesc="Recipe management software. Supports MealMaster recipes, import, export, search, display, edit, and printing them."
arch=('x86_64')
url="https://github.com/wedesoft/anymeal"
license=('GPL3')
depends=('sqlite' 'qt5-base' 'recode')
makedepends=('autoconf' 'automake' 'libtool' 'flex' 'gtest' 'qt5-tools' 'git')
source=("git+https://github.com/wedesoft/anymeal.git")
conflicts=("anymeal")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    autoreconf -fi
}

build() {
    cd "$srcdir/$pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
}
