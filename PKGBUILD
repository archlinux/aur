# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>
pkgname=simplex-desktop-fixed-bin
pkgver=7.0.0
pkgrel=1
pkgdesc="The first messaging platform that has no user identifiers — desktop GUI client"
arch=('x86_64')
url="https://simplex.chat"
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'e2fsprogs'
    'fontconfig'
    'freetype2'
    'fribidi'
    'gmp'
    'harfbuzz'
    'jack2'
    'java-runtime'
    'libdrm'
    'libglvnd'
    'libgpg-error'
    'libusb'
    'libx11'
    'libxcb'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
    'openssl'
    'xdg-utils'
    'zlib'
)
provides=('simplex-desktop' 'simplex-desktop-bin')
conflicts=('simplex-desktop' 'simplex-desktop-bin')
options=('!debug' '!strip')
source=("simplex-desktop-${pkgver}.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-ubuntu-24_04-${CARCH}.deb")
sha256sums=('f70f44d512d4b2446b52b1573fafc17e9cf65ddef7c9128b49ca43cf628210f2')

package() {
    cd "${srcdir}"
    tar --zstd -xf data.tar.zst -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "${pkgdir}/usr/share/applications/simplex.desktop"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/simplex/bin/simplex "${pkgdir}/usr/bin/simplex-desktop"
}
