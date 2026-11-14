# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=siril-appimage
pkgver=1.4.5
pkgrel=1
url='https://siril.org'
pkgdesc='Siril is an astronomical image processing tool'
arch=(x86_64)
license=('GPL3')
provides=(siril)
conflicts=(siril)
optdepends=('libpng: PNG import'
            'libjpeg-turbo: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')
options=('!strip' '!debug')
source_x86_64=("https://free-astro.org/download/Siril-${pkgver}-x86_64.AppImage")
sha512sums_x86_64=('8b9c4f40b7ec3b1dca366dfa0df2b6d1def7850350ce2873716f715d4e611d657b2814536315f5fbdfeeb7fbae4bfb1525bd4fe968ee100729b5ea0fa0d9359e')

prepare() {
  rm -rf -- "${srcdir}/squashfs-root" "${srcdir}/siril-${pkgver}"

  chmod +x "Siril-${pkgver}-x86_64.AppImage"
  ./"Siril-${pkgver}-x86_64.AppImage" --appimage-extract

  mv -- "${srcdir}/squashfs-root" "${srcdir}/siril-${pkgver}"
}

package() {
  install -Dm755 \
    "${srcdir}/Siril-${pkgver}-x86_64.AppImage" \
    "${pkgdir}/usr/bin/siril"

  install -Dm644 \
    "${srcdir}/siril-${pkgver}/usr/share/applications/org.siril.Siril.desktop" \
    "${pkgdir}/usr/share/applications/org.siril.Siril.desktop"

  cp -a \
    "${srcdir}/siril-${pkgver}/usr/share/icons/." \
    "${pkgdir}/usr/share/icons/"
}
