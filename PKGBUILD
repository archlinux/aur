# Maintainer: George Alexiou <goten002@gmail.com>

pkgname=kensaku-search-bin
_pkgname=kensaku
pkgver=1.0.17
pkgrel=1
pkgdesc="Fast local search for files, contents, documents and OCR'd images, with an MCP/CLI backend for AI agents (prebuilt)"
arch=('x86_64')
url="https://github.com/yjid/kensaku"
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libayatana-appindicator' 'libgcc' 'libsoup3' 'libstdc++' 'webkit2gtk-4.1')
optdepends=('tesseract: classic Tesseract OCR engine (selectable in Settings)')
provides=('kensaku-search')
# Both install /usr/bin/kensaku; kensaku-bin is an unrelated kanji dictionary.
conflicts=('kensaku-search' 'kensaku-bin')
options=('!strip' '!debug')
_release="${url}/releases/download/v${pkgver}"
source=("${_pkgname}-${pkgver}.deb::${_release}/${_pkgname}_${pkgver}_amd64.deb"
        "${_pkgname}-cli-${pkgver}::${_release}/kensaku-cli-linux-x86_64"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/yjid/kensaku/v${pkgver}/LICENSE")
noextract=("${_pkgname}-cli-${pkgver}")
# deb and cli from upstream SHA256SUMS
sha256sums=('0a8f6d044f2a872a9530f74fdbcad49174873a82e618806eb0e7d5c795bb47d2'
            '11f3871f3d8e6d025b82de555d0aed35ebf6edd616da115594b08224cefc032a'
            '2af98e5c08613929549a6583dde804fe91ae9744bfac97471d7a21c4617ab93a')

package() {
  bsdtar -xf data.tar.* -C "${pkgdir}" --no-same-owner
  chmod -R u+rwX,go+rX,go-w "${pkgdir}/usr"

  install -Dm755 "${_pkgname}-cli-${pkgver}" "${pkgdir}/usr/bin/kensaku-cli"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
