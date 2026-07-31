# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=siril-appimage
pkgver=1.4.4
pkgrel=2
url='https://siril.org'
pkgdesc='Siril is an astronomical image processing tool'
arch=(x86_64)
license=('GPL3')
provides=(siril)
conflicts=(siril)
optdepends=('libpng: PNG import'
            'libjpeg: JPEG import and export'
            'libtiff: TIFF import and export'
            'libraw: DSLR RAW images import'
            'ffms2: films native support as image sequences and import'
            'libcurl-gnutls: check for updates'
            'gnuplot: photometry graphs creation')
options=('!strip' '!debug')
source_x86_64=("https://free-astro.org/download/Siril-${pkgver}-x86_64.AppImage")
sha512sums_x86_64=('e1ec83b2bd80ad4f0d3c5a5424afc63a9eba0b1a8766f7e6ad3beef9743200b0c2949060abc1ec961b2177b5051e6320770c98c47422f08d5d36901c2bb13149')

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
