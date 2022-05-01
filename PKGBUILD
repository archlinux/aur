# Maintainer: holishing <holishingtest@gmail.com>
# Contributor: Yenting Chen <coolcyt@gmail.com>
# Contributor: Lyman Li <lymanrb@gmail.com>

pkgname=pcmanx-gtk2
pkgver=1.3
pkgrel=2
pkgdesc="A gtk+ based free BBS client"
arch=('i686' 'x86_64')
url="https://github.com/pcman-bbs/pcmanx"
license=('GPL')
depends=('gtk2' 'libltdl')
optdepends=('wget')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
options=('!libtool')
source=(https://github.com/pcman-bbs/pcmanx/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz
        pcmanx.install
        patch-src-mainframe.cpp)
md5sums=('9796c55ca5df674251be713a5019e3bc'
         '6374916400684c2db957be0250a4ca98'
         '5de241f8226b7cc6aea6b184cdc7b9ea')
install=pcmanx.install

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    patch -p1 < ${srcdir}/patch-src-mainframe.cpp
    ./configure --prefix=/usr --enable-wget --enable-iplookup --enable-proxy || return 1
    make || return 1
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install || return 1
}
