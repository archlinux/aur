# Maintainer: Sohrab Behdani <behdanisohrab@gmail.com>
pkgname=zedsecure-bin
pkgver=3.1.6
pkgrel=1
pkgdesc="ZedSecure VPN client"
arch=('x86_64')
url="https://github.com/CluvexStudio/ZedSecure"
license=('AGPL-3.0')
depends=(
    'alsa-lib'
    'brotli'
    'expat'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glibc'
    'glu'
    'libbsd'
    'libglvnd'
    'libpng'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'libmd'
    'zlib'
    'xdg-utils'
)
makedepends=('zstd')
source=("${pkgname}-${pkgver}-amd64.deb::https://github.com/CluvexStudio/ZedSecure/releases/download/v${pkgver}/ZedSecure-${pkgver}-amd64.deb")
sha256sums=('87278ef16571c3dcb5277172f0491731d74f31727088243261acd3683645e9d0')
noextract=("${pkgname}-${pkgver}-amd64.deb")

package() {
    cd "${srcdir}"

    ar x "${pkgname}-${pkgver}-amd64.deb"
    tar --use-compress-program=unzstd -xf data.tar.zst

    install -dm755 "${pkgdir}/opt"
    cp -a opt/zedsecure "${pkgdir}/opt/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/zedsecure/bin/ZedSecure" "${pkgdir}/usr/bin/${pkgname}"
    ln -sf "/opt/zedsecure/bin/ZedSecure" "${pkgdir}/usr/bin/zedsecure"

    install -Dm644 opt/zedsecure/lib/zedsecure-ZedSecure.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    install -Dm644 opt/zedsecure/lib/ZedSecure.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
}
