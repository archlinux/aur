# Maintainer: dingjing <dingjing[at]live[dot]cn>
# Cloud Server
_server=cpx51

pkgbase=graceful-platform-theme
pkgname=('graceful-platform-theme' 'graceful-platform-theme-dbg')
pkgver=1.0.3
pkgrel=1
arch=('x86_64')
url="https://github.com/graceful-linux/graceful-platform-theme"
license=('GPL')
depends=(
    'qt5-base'
)
makedepends=(
    'git'
    'qt5-base'
)
source=(
    "https://github.com/graceful-linux/graceful-platform-theme/archive/${pkgver}.tar.gz"
)

sha256sums=(
    "e7248db4d6d502cf0a16c23688c53230ceabecd547b244345a8802d23cf430fd"
)
    
prepare() {
    msg "prepare"
}
    
build() {
    msg "build"
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
    make all -j32
}

package_graceful-platform-theme() {
    msg "graceful-platform-theme package"

    cd "${srcdir}/graceful-platform-theme-${pkgver}/lib"
    rm -rf libgraceful.so
    make release -j32

    cd "${srcdir}/graceful-platform-theme-${pkgver}"

    install -d -Dm755                   "${pkgdir}/usr/share/icons/"
    install -d -Dm755                   "${pkgdir}/usr/share/themes/"

    cp -ra icon/graceful/               "${pkgdir}/usr/share/icons/"
    cp -ra theme/graceful/              "${pkgdir}/usr/share/themes/"
    install -Dm644 ../../README.md      "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 ../../LICENSE        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lib/libgraceful.so   "${pkgdir}/usr/lib/qt/plugins/styles/libgraceful.so"
}

package_graceful-platform-theme-dbg() {
    msg "graceful-platform-theme-dbg package"

    cd "${srcdir}/graceful-platform-theme-${pkgver}/lib"
    rm -rf lib/libgraceful.so
    make debug -j32

    cd "${srcdir}/graceful-platform-theme-${pkgver}"

    install -d -Dm755                   "${pkgdir}/usr/share/icons/"
    install -d -Dm755                   "${pkgdir}/usr/share/themes/"

    cp -ra icon/graceful/               "${pkgdir}/usr/share/icons/"
    cp -ra theme/graceful/              "${pkgdir}/usr/share/themes/"
    install -Dm644 ../../README.md      "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 ../../LICENSE        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lib/libgraceful.so   "${pkgdir}/usr/lib/qt/plugins/styles/libgraceful.so"
}


