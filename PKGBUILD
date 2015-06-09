# Maintainer: Yunhui Fu <yhfudev at gmail dot com>

pkgname=libucd-git
pkgver=553d21c
pkgrel=1
pkgdesc="Universal Charset Detector C/C++ API"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/yhfudev/cpp-libucd.git"
license=('GPL')
depends=('gcc-libs' 'bash')
makedepends=('git')
provides=('libucd-git')
conflicts=('libucd')
#install="$pkgname.install"
#PKGEXT=.pkg.tar.xz
source=(
        "$pkgname::git+https://github.com/yhfudev/cpp-libucd.git"
        )

md5sums=(
         'SKIP'
         )

pkgver() {
    cd "$srcdir/$pkgname"
    local ver="$(git show | grep commit | awk '{print $2}'  )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

prepare() {
    cd "$srcdir/$pkgname"
    #cd "${srcdir}/${pkgname}-${pkgver}"
    #patch -p0 < "$srcdir/libucd-fix.patch"
}

build() {
    cd "$srcdir/$pkgname"
    #cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --disable-static --disable-icu
    make
}

package() {
    cd "$srcdir/$pkgname"
    #cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
}
