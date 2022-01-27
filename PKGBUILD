# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
pkgname=easytaxag
pkgver=2021.1.0
pkgrel=1
pkgdesc="EasyTax Applikation zur Steuererklärung 2021 für den Kanton Aargau"
arch=('any')
url="https://msg-easytax.ch/ag/"
license=('GPL2')
depends=(
  'sh'
  'hicolor-icon-theme'
  'java-runtime=8'
)
source=(
  https://msg-easytax.ch/ag/${pkgver%%.*}/EasyTax${pkgver%%.*}AG_unix_$(echo ${pkgver#*.} | sed 's/\./_/').tar.gz

  easytaxag.desktop
)

sha256sums=('531c03131b5a9ecf500fee3fbbf03e215d5ac02db6e5bcae72016838d09f17d8'
            '198bb1c5a5115925f97bd7090bdd8e1dbd9927f1efabe1f1f1166a4cabb0bfe0')

package() {
    cd "${pkgdir}"
    install -d usr/share/java
    cp -rp "${srcdir}"/EasyTax${pkgver%%.*}AG usr/share/java

    install -d usr/bin
    ln -sf /usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG usr/bin/EasyTax${pkgver%%.*}_AG

    install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/i4j_extf_9_171xd9w_1txahfq.png usr/share/icons/hicolor/64x64/apps/easytaxag.png
    install -Dp "${srcdir}"/easytaxag.desktop usr/share/applications/easytaxag.desktop
}
