# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=trios
pkgname=${_basename}-bin
pkgver=1.7.0
pkgrel=2
pkgdesc="Starsector mod manager & toolkit."
arch=('x86_64')
url="https://github.com/wispborne/TriOS"
license=('LicenseRef-TriOS-Community-License-1.0')
depends=(
    'at-spi2-core'
    'cairo'
    'curl'
    'fontconfig'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'harfbuzz'
    'hicolor-icon-theme'
    'libepoxy'
    'libgcc'
    'libstdc++'
    'pango'
    'zlib')
optdepends=('starsector')
_srcext="${pkgname}-${pkgver}"
source=("${_srcext}.zip::https://github.com/wispborne/TriOS/releases/download/${pkgver}/TriOS-Linux.zip"
    "${_srcext}-LICENSE.txt::https://raw.githubusercontent.com/wispborne/TriOS/refs/tags/${pkgver}/LICENSE.txt"
    "${_basename}.desktop")
sha256sums=('0d4a9fcf8fca93fef7b24bf20bedf36a29d17ee2eb41fa9115174b46de25fb74'
    '45e3bf8ce58e4cd361fca407b750c2921ea2414be46c50c730934af030aa217f'
    'a34536873f548821d7d91f192029114470f066fbac5aeb5854ad36bc2ed91f24')

package() {
    install -Dm644 "${srcdir}/${_srcext}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    install -Dm644 "${srcdir}/${_basename}.desktop" "${pkgdir}/usr/share/applications/${_basename}.desktop"

    install -Dm644 "${srcdir}/TriOS/data/flutter_assets/assets/images/telos_faction_crest.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_basename}.png"
    install -Dm644 "${srcdir}/TriOS/data/flutter_assets/assets/images/telos_faction_crest.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_basename}.svg"

    install -Dm755 "${srcdir}/TriOS/TriOS" "${pkgdir}/opt/${pkgname}/TriOS"

    cp -r "${srcdir}/TriOS/data" "${pkgdir}/opt/${pkgname}/"
    cp -r "${srcdir}/TriOS/lib" "${pkgdir}/opt/${pkgname}/"

    chmod 755 "${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/linux/7zip/x64/7zzs"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/TriOS" "${pkgdir}/usr/bin/TriOS"
}
