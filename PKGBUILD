# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=touplite
pkgver=2.1.31488.20260519
pkgrel=1
pkgdesc="A port of the ToupTek Photonics's PC software ToupLite for Linux"
arch=('i686' 'x86_64')
url="https://www.touptekphotonics.com/download/?category=Linux"
depends=(fontconfig dbus libglvnd libxrender freetype2)
license=('custom')
source_x86_64=("ToupTekToupLite.x64-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/downloads/software/ToupTekToupLite.x64.tar.bz2")
source_i686=("ToupTekToupLite.x86-${pkgver}.tar.bz2"::"https://www.touptekphotonics.com/downloads/software/ToupTekToupLite.x86.tar.bz2")
sha256sums_i686=('758e0139e9d3388352079dc2ee795fffc5fa91261a190438e8f4938b9040baa1')
sha256sums_x86_64=('f8d6883d0b90ce421e8dbba93751baeb1285f7d84d455f99040f4b2a5667bc92')
options=('!strip')

prepare() {
  ARCH_STR=$( [ "$CARCH" == "x86_64" ] && echo -n x64 || echo -n x86 )
  sed -n -e '1,/^exit 0$/!p' ToupTekToupLite.${ARCH_STR}.sh | tar xvz
  #rm -f ToupTekToupLite.${ARCH_STR}.sh
}

package() {
  install -Dm755 ToupLite -t "${pkgdir}/usr/local/ToupLite/"
  install -Dm644 *.so ToupLite.png -t "${pkgdir}/usr/local/ToupLite"

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/usr/local/ToupLite/ToupLite" "${pkgdir}/usr/bin/ToupLite"

  install -Dm644 i18n/*.xml -t "${pkgdir}/usr/local/ToupLite/i18n/"
  install -Dm644 99-toupcam.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 ToupLite.desktop -t "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
