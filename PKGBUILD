# Maintainer: Jayvee Enaguas <harvettfox96@airmail.cc>

pkgname=ttf-halfeighties
pkgver=20191127.01
pkgrel=1
pkgdesc="A raster monospace sans serif typeface from famous Sega titles around mid to late 1980s."
url="https://notabug.org/HarvettFox96/${pkgname}"
license=("OFL-1.1")
arch=("any")
depends=("fontconfig" "xorg-font-utils" "xorg-fonts-encodings")
source=("HalfEighties-${pkgver}.zip::https://notabug.org/attachments/f1540e4c-bfbb-45c3-9e08-ed8f533a0771"
        "HalfEighties-${pkgver}.zip.sig::https://notabug.org/attachments/d981ad84-05d1-45ca-8dd9-0729f86d1fe7")
sha512sums=("e8c4b277a9ab05d18673d5fcc0e5f78ccf90a8cc033922898e8481bbd9f668b0d6bcad0da479c674db3ea1624d84fa775fc7a3f2f971d020218cc9fa5815cf70"
            "SKIP")
validpgpkeys=("30E2144356008681839AE9C192F8F52D258B63E6"
              "4C565E3C3DB4DE43785F0DA9B627DC6AB09D9B83")

prepare() {
  # Convert format to Unix by removing all carriage return characters

  sed -e 's/\r//g' LICENSE.txt > LICENSE;
}

package() {
  # Install font file(s)

  install -dm755 "${pkgdir}/usr/share/fonts/TTF/";
  install -Dm644 *.ttf "${pkgdir}/usr/share/fonts/TTF/";

  # Install licence file

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE";

  # Clean all files in the source directory

  rm -fr "${srcdir}/"*;
}
