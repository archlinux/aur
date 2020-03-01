# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>
pkgname=easytaxag
pkgver=2020.1.3
pkgrel=1
pkgdesc="EasyTax Applikation zur Steuererklärung 2020 für den Kanton Aargau"
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

sha256sums=('23b5789ac772c1551b95d6db5ee8f143c7dced9e4a00b701740db6f3a6837abd'
            '42a91c740c23c6bff2026ce66becc65aa774690ca82077199417b9e01f202faa')

package() {
    cd "${pkgdir}"
    install -d usr/share/java
    cp -rp "${srcdir}"/EasyTax${pkgver%%.*}AG usr/share/java

    install -d usr/bin
    ln -sf /usr/share/java/EasyTax${pkgver%%.*}AG/EasyTax${pkgver%%.*}_AG usr/bin/EasyTax${pkgver%%.*}_AG

    install -Dp "${srcdir}"/EasyTax${pkgver%%.*}AG/.install4j/i4j_extf_9_l93ryc_1txahfq.png usr/share/icons/hicolor/64x64/apps/easytaxag.png
    install -Dp "${srcdir}"/easytaxag.desktop usr/share/applications/easytaxag.desktop
}
