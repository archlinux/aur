# Maintainer: Sohrab Behdani <behdanisohrab@gmail.com>
pkgname=zedsecure-bin
pkgver=3.1.2
pkgrel=2
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
source=("${pkgname}-${pkgver}-amd64.deb::https://github.com/CluvexStudio/ZedSecure/releases/download/desktop-v${pkgver}/ZedSecure-${pkgver}-amd64.deb")
sha256sums=('76b9d2525d5a53bc923705c9f3e320d9d5f88d3cd82f0dc69f356bc623b4fcf4')
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
