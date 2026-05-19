# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Maintainer : Robin Candau <antiz@archlinux.org>
# Contributor: Mikalai Ramanovich < narod.ru: nikolay.romanovich >

pkgname=onlyoffice-bin
pkgver=9.4.0
pkgrel=1
pkgdesc='An office suite that combines text, spreadsheet and presentation editors'
arch=('x86_64')
url='https://www.onlyoffice.com/'
license=('AGPL-3.0-only')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'curl'
    'dbus'
    'desktop-file-utils'
    'expat'
    'fontconfig'
    'freetype2'
    'glib2'
    'glibc'
    'gtk3'
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-ugly'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libgcc'
    'libgl'
    'libnotify'
    'libpulse'
    'libstdc++'
    'libx11'
    'libxcomposite'
    'libxdamage'
    'libxcb'
    'libxext'
    'libxfixes'
    'libxi'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'mesa'
    'nss'
    'nspr'
    'pango'
    'sh'
    'ttf-carlito'
    'ttf-dejavu'
    'ttf-liberation')
optdepends=(
    'gst-libav: for playing embedded video files'
    'gst-plugins-good: for playing embedded video files'
    'libreoffice: for OpenSymbol fonts'
    'otf-takao: for japanese Takao fonts'
    'ttf-ms-fonts: for Microsoft fonts')
provides=("onlyoffice=${pkgver}")
conflicts=('onlyoffice')
options=('!debug' '!emptydirs' '!strip')
source=("onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb"::"https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v${pkgver}/onlyoffice-desktopeditors_amd64.deb"
        '010-onlyoffice-bin-fix-document-opening.patch')
noextract=("onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb")
sha256sums=('4271434e81be42b1559fd989d24bf6d413482f278dc6a5e328202a4fc1a18649'
            '670de5f8b72679a54ff41a96ba1bdba9231a93260d1a8eaf304f66c8e40efdb7')

prepare() {
    mkdir -p "onlyoffice-${pkgver}/pkg"
    bsdtar -xf "${srcdir}/onlyoffice-desktopeditors-${CARCH}-${pkgver}.deb" -C "onlyoffice-${pkgver}"
    bsdtar -xf "onlyoffice-${pkgver}/data.tar.xz" -C "onlyoffice-${pkgver}/pkg"
    patch -d "onlyoffice-${pkgver}/pkg" -Np1 -i "${srcdir}/010-onlyoffice-bin-fix-document-opening.patch"
}

package() {
    cp -dr --no-preserve='ownership' "onlyoffice-${pkgver}"/pkg/* "$pkgdir"
}
