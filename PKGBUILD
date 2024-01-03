# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=cooja
pkgname=cooja-git
pkgver=be76fec5
pkgrel=1
pkgdesc="An open source network simulator"
arch=('any')
url="https://github.com/contiki-ng/cooja"
license=('BSD-3-Clause')
depends=('sh' 'java-runtime')
makedepends=('git' 'java-environment')
source=('git+https://github.com/contiki-ng/cooja.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --always
}

build() {
  cd "$_pkgname"

  ./gradlew fullJar
}

package() {
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/java/cooja/"
  cp -r "$_pkgname/build/libs/cooja-full.jar" "$pkgdir/usr/share/java/cooja/cooja.jar"
  install -m755 "$srcdir/../cooja.sh" "$pkgdir/usr/bin/cooja"
}
