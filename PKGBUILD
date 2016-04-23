# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=sile-git
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.9.3_446_g21db1ae
_branch='master'
pkgrel=1
arch=(any)
url='http://www.sile-typesetter.org/'
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/alerque/${pkgname%-git}.git#branch=${_branch}")
sha512sums=('SKIP')
depends=('lua-lpeg'
         'lua-expat'
         'lua-filesystem'
         'lua-utf8'
         'fontconfig'
         'harfbuzz')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/-/_/g'
}

prepare () {
    cd "$srcdir/${pkgname%-git}"
    ./bootstrap.sh
}

build () {
    cd "$srcdir/${pkgname%-git}"
    ./configure
    make
}

package () {
    cd "$srcdir/${pkgname%-git}"
    make install DESTDIR="${pkgdir}/"
}
