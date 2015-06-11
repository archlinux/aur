# Maintainer:  trashstar <trash@ps3zone.org>

pkgname=xsdm
pkgver=0.1.3.beta.r20.g26f280e
pkgrel=1
pkgdesc="Open-source unpacker for Dreamspark's SDC format."
arch=('i686' 'x86_64')
url="https://github.com/v3l0c1r4pt0r/xSDM"
license=('GPL')
depends=('libmcrypt' 'zlib')
makedepends=('git' 'check')
source=('git://github.com/v3l0c1r4pt0r/xSDM')
md5sums=('SKIP')

pkgver() {
    cd xSDM
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/xSDM"
    sed -i 's/1.14/1.15/g' configure
}

build() {    
    cd "${srcdir}/xSDM"
    chmod +x ./configure
    ./configure
    make
}

package() {
    cd "${srcdir}/xSDM/src"
    install -m755 -d "${pkgdir}/usr/bin"
    install -m755 "xsdm" "${pkgdir}/usr/bin/"
}
