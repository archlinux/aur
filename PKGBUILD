# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
pkgname=easytaxag
pkgver=2023.1.1
pkgrel=1
pkgdesc="EasyTax Applikation zur Steuererklärung 2023 für den Kanton Aargau"
arch=('any')
url="https://msg-easytax.ch/ag/"
license=('unknown')
depends=(
  'sh'
  'hicolor-icon-theme'
  'jre17-openjdk'
)
source=(
  https://msg-easytax.ch/ag/${pkgver%%.*}/EasyTax${pkgver%%.*}AG_unix_$(echo ${pkgver#*.} | sed 's/\./_/').tar.gz
  https://upload.wikimedia.org/wikipedia/commons/d/d9/Wappen_Aargau.svg

  easytaxag.desktop
  EasyTax_AG.patch
)

sha256sums=(
  '6a47a7cff7232fe88f3661305464e18319b4a104233b36cdf28a2a5e52cdef70'
  '253d315b20371cd9add777dc990f96545c60d5d07a3f34cd33720d5148e82486'
  'caf1ddd0e3dfbc4c25ed2f90033587a8ff9872f5c51791893448a651e3a22b2e'
  'ae25c2210ddb59098400c5cc70896e8a696b209da3061931d633d04d05dee477'
)

package() {
  cd "${pkgdir}"
  install -d usr/share/java
  cp -rp "${srcdir}"/EasyTax${pkgver%%.*}AG usr/share/java
  patch usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG <"${srcdir}"/EasyTax_AG.patch

  install -d usr/bin
  ln -sf /usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG usr/bin/EasyTax${pkgver%%.*}_AG

  install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/i4j_extf_8_1tt1hdl_1txahfq.png usr/share/icons/hicolor/64x64/apps/easytaxag.png
  install -Dp "${srcdir}"/Wappen_Aargau.svg usr/share/icons/hicolor/scalable/apps/easytaxag.svg

  install -Dp "${srcdir}"/easytaxag.desktop usr/share/applications/easytaxag.desktop
}
