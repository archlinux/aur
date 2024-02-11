# Maintainer: Zineddine SAIBI <saibi.zineddine@yahoo.com>

pkgname=deeptags
pkgver=0.8.0
pkgrel=1
pkgdesc="A Markdown notes manager"
arch=('x86_64')
url="https://github.com/SZinedine/DeepTags"
license=('GPL3')
depends=(
    'qt5-base'
    'qt5-svg'
)
makedepends=(
    'qt5-tools'
    'git'
    'gcc'
    'make'
)
source=(
    "https://github.com/SZinedine/DeepTags/releases/download/${pkgver}/DeepTags-${pkgver}.tar.xz"
)
sha256sums=(
    '5b3163323c3ce90f83fb2372b113039fb586ef4e75bdd4626ce7fa6b109232d1'
)
conflicts=("deeptags-git")


prepare() {
    cmake                               \
        -B build/                       \
        -DCMAKE_CXX_COMPILER=g++
}

build() {
    cmake                               \
        --build build/                  \
        --config Release
}

package() {
    install -Dm 755 build/deeptags                               "${pkgdir}/usr/bin/deeptags"
    install -Dm 644 "packaging/resources/${pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
    install -Dm 644 "packaging/resources/${pkgname}.desktop"     "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm 644 LICENSE                                      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local srcIco=packaging/resources/icons/hicolor
    local destIco=${pkgdir}/usr/share/icons/hicolor
    for icon in 16x16 32x32 48x48 64x64 80x80 96x96 128x128 192x192 256x256 384x384 512x512; do
        install -Dm 644 "${srcIco}/${icon}/apps/${pkgname}.png"  "${destIco}/${icon}/apps/${pkgname}.png"
    done

    install -Dm 644 "${srcIco}/scalable/apps/${pkgname}.svg"   "${destIco}/scalable/apps/${pkgname}.svg"
}
