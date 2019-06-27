# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>

pkgname=sile-git
pkgdesc='Modern typesetting system inspired by TeX'
pkgver=0.9.5.1.r228.g1a1904c
_branch='testing'
pkgrel=1
arch=(any)
url='http://www.sile-typesetter.org/'
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('fontconfig'
         'harfbuzz>=1.4.2'
         'icu'
         'ttf-gentium-plus')
optmakedepents=('luajit')
makedepends=('git'
             'lua-busted'
             'lua-luacov=0.8'
             'lua-luacov-coveralls')
source=("git://github.com/alerque/${pkgname%-git}.git#branch=$_branch")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd "$srcdir/${pkgname%-git}"
    ./bootstrap.sh
}

build () {
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix=/usr
    make
}

package () {
    cd "$srcdir/${pkgname%-git}"
    make install DESTDIR="$pkgdir/"
}
