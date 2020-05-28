# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5-styleplugins
pkgver=5.0.0.20170311
_commit=335dbece103e2cbf6c7cf819ab6672c2956b17b3
pkgdesc='Additional style plugins for Qt5'
pkgrel=21
arch=('x86_64')
url="https://github.com/qt/qtstyleplugins"
license=('LGPL')
depends=('qt5-base' 'gtk2')
source=(
    "${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz"
    "fix-build-against-Qt-5.15.patch"
)
sha512sums=(
    'e8c2d0e9c6b0a47cab04ffd2e9384606638905b63a7c1580f9b629bbcc84ebff19743363ffee3dbd31c3de1dcda684211ad3052932b5aa0081e529afd9cbb14d'
    'f5cedadceb7c4243ba69b5041c6c524223ce742ec9c2c483e706f31e32e9e03e4efb6ed54fa2aada867a7c0145a8f3ec1193377d177c6c77066b5f3ec191e9ce'
)

prepare() {
    cd qtstyleplugins-${_commit}

    patch -p1 < "$srcdir/fix-build-against-Qt-5.15.patch"
}

build() {
    cd qtstyleplugins-${_commit}

    qmake PREFIX='/usr' \
        CONFIG+='nostrip' \
        QMAKE_CFLAGS_RELEASE="$CFLAGS" \
        QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
    make
}

package() {
    cd qtstyleplugins-${_commit}

    make INSTALL_ROOT="${pkgdir}" install
}
