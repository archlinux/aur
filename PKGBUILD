# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=esearch
pkgname="${_pkgname}-electron-bin"
pkgver=1.10.0
pkgrel=6
pkgdesc="Screenshot OCR search translate search for picture paste the picture on the screen screen recorder (with system electron)
            截屏 离线OCR 搜索翻译 以图搜图 贴图 录屏 滚动截屏"
arch=("x86_64")
url="https://esearch-app.netlify.app/"
_githuburl="https://github.com/xushengfeng/eSearch"
license=('GPL3')
depends=(alsa-lib qt5-base nss nodejs gtkmm3 at-spi2-core libxcb gdk-pixbuf2 
    cairo libcups libxdamage libxrandr glibmm atkmm pangomm expat libxtst libxext
    libxfixes libxt glibc glib2 zlib mesa cairomm hicolor-icon-theme gtk3 dbus harfbuzz 
    libxkbcommon gcc-libs libsigc++ pango libx11 nspr libxcomposite libdrm electron)
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}-appimage" "${_pkgname}-bin")
options=(!strip)
source=("${_pkgname}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}-beta.${pkgrel}/eSearch-${pkgver}-beta.${pkgrel}-linux-X64.tar.gz"
        "e-search.sh")
sha256sums=('789d0b83136adf60442934d0a895ef2f4e16ae0008f6903a80873f2533d8a811'
            '60a603296c1457df85ef51f5f530461243c07fedbd63af8844666f5400c318f3')

package() {
    export LC_ALL=C.UTF-8
    install -Dm755 "e-search.sh" "${pkgdir}/usr/bin/e-search"
    install -dm755 "${pkgdir}/usr/lib/"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    cd "${srcdir}/eSearch-${pkgver}-beta.${pkgrel}-linux-x64"
    ln -s "/usr/lib/esearch/assets/e-search.desktop" "${pkgdir}/usr/share/applications/"
    cp --no-preserve=mode,ownership "resources/app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/e-search.svg"
    cp -r --no-preserve=ownership "resources/app" "${pkgdir}/usr/lib/esearch"
}
