# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=cooja
pkgname=cooja-git
pkgver=be76fec5
pkgrel=2
pkgdesc="An open source network simulator"
arch=('any')
url="https://github.com/contiki-ng/cooja"
license=('BSD-3-Clause')
depends=('sh' 'java-runtime')
makedepends=('git' 'java-environment')
source=(
  'git+https://github.com/contiki-ng/cooja.git'
  'cooja.sh'
  'cooja.desktop'
)
sha512sums=(
  'SKIP'
  '3f632db76b93ea0ed5423c98b669265fe4589d9d947ffa61729b1b5c738675aa4784a03dbe60e7e853ca405e6909f829353e160308f41450c79a5f7c7a3a0fc9'
  '375dcacc687700d6ee557ec8eb22d1ea3c73e201dae2c757102cc57964ca9ac3388760b278f086adf4dd854b9aa075e9dd416e1d2a21bddfd0d449dfb56dff70'
)

pkgver() {
    cd "$_pkgname"
    git describe --long --always
}

build() {
  cd "$_pkgname"

  ./gradlew fullJar
}

package() {
  install -Dm0644 "$_pkgname/build/libs/cooja-full.jar" "$pkgdir/usr/share/java/cooja/cooja.jar"
  install -Dm0644 "cooja.desktop" "$pkgdir/usr/share/applications/cooja.desktop"
  install -Dm0755 "cooja.sh" "$pkgdir/usr/bin/cooja"
}
