# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
pkgname=easytaxag
pkgver=2021.1.3
pkgrel=1
pkgdesc="EasyTax Applikation zur Steuererklärung 2021 für den Kanton Aargau"
arch=('any')
url="https://msg-easytax.ch/ag/"
license=('unknown')
depends=(
  'sh'
  'hicolor-icon-theme'
  'jre8-openjdk'
)
source=(
  https://msg-easytax.ch/ag/${pkgver%%.*}/EasyTax${pkgver%%.*}AG_unix_$(echo ${pkgver#*.} | sed 's/\./_/').tar.gz

  easytaxag.desktop
  EasyTax_AG.patch
)

sha256sums=(
  '1dce65837fe258fda921035f11e724d6d19680c6ca6cab94e0551a8dd406be18'
  '198bb1c5a5115925f97bd7090bdd8e1dbd9927f1efabe1f1f1166a4cabb0bfe0'
  'fa7c2394bf85dcc2449258ba40509069964e726f65ecbd26256d5aba95c62291'
)

package() {
  cd "${pkgdir}"
  install -d usr/share/java
  cp -rp "${srcdir}"/EasyTax${pkgver%%.*}AG usr/share/java
  patch usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG <"${srcdir}"/EasyTax_AG.patch

  install -d usr/bin
  ln -sf /usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG usr/bin/EasyTax${pkgver%%.*}_AG

  install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/i4j_extf_9_171xd9w_1txahfq.png usr/share/icons/hicolor/64x64/apps/easytaxag.png
  install -Dp "${srcdir}"/easytaxag.desktop usr/share/applications/easytaxag.desktop
}
