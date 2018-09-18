# PKGBUILD for ag
# Maintainer: Allen Wild <allenwild93 at gmail dot com>

pkgdesc="Allen Wild's fork of ag, which supports pcre2 and .agrc user config"
url='https://github.com/aswild/the_silver_searcher'
pkgname=the_silver_searcher_wild-git
pkgver=2.2.0.r141.g8e65660
pkgrel=1
provides=('the_silver_searcher')
conflicts=('the_silver_searcher')

arch=('x86_64' 'i686')
license=('Apache')

depends=('pcre2' 'xz' 'zlib')
makedepends=('git')
checkdepends=('python-cram')

_srcname="the_silver_searcher"
source=("git://github.com/aswild/${_srcname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_srcname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_srcname"
    ./autogen.sh
    ./configure --prefix=/usr --with-pcre2 --enable-zlib --enable-lzma \
                ac_cv_prog_CLANG_FORMAT=no
    make
}

check() {
    cd "$srcdir/$_srcname"
    make check
}

package() {
    cd "$srcdir/$_srcname"
    make DESTDIR="$pkgdir/" install
}
