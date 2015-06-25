# Maintainer: Yunhui Fu <yhfudev@gmail.com>

_pkgbase="u8glib-git"
#pkgname=('libu8gwpi-git' 'libu8gsdl-git')
pkgname=('u8glib-git')
pkgver=e7cd227
pkgrel=1
pkgdesc="Universal Graphics Library for 8 Bit Embedded Systems"
arch=( 'i686' 'x86_64' 'armv5tel' 'armv7l' )
url='http://code.google.com/p/u8glib/'
license=('BSD')
depends=('wiringpi-git')
makedepends=('wiringpi-git')
#conflicts=('libu8gwpi-git' 'libu8gsdl-git')

source=("${_pkgbase}::git+https://github.com/olikraus/u8glib.git"
    )
md5sums=('SKIP'
    )

pkgver_git() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

prepare() {
    cd "${srcdir}/${_pkgbase}"
}

build() {
    cd "${srcdir}/${_pkgbase}"
    ./autogen.sh
    ./configure --prefix=/usr
    make $MAKEFLAGS
}

check() {
    make -C "${srcdir}/${_pkgbase}" check
}

package() {
    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
}

package_libu8gwpi-git() {
    conflicts=('libu8gwpi')
    provides=('libu8gwpi')
    #replaces=('libu8gwpi-git')

    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
}

package_libu8gsdl-git() {
    pkgdesc='Python 2 bindings for Google Protocol Buffers'
    #depends=('libu8g')
    conflicts=('libu8gsdl-git')
    provides=('libu8gsdl')
}
