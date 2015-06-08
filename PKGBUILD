# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=yuicompressor-git
pkgver=2.4.8.r15.f71090d
pkgrel=1
pkgdesc='The Yahoo! JavaScript and CSS Compressor'
arch=('any')
url='http://yui.github.io/yuicompressor/'
license=('BSD')
depends=('java-runtime')
makedepends=('apache-ant')
provides=('yuicompressor')
conflicts=('yuicompressor')
source=('git+https://github.com/yui/yuicompressor.git')
sha256sums=('SKIP')

pkgver() {
  cd yuicompressor

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/; s/-/./g; s/^v//')"
}

build() {
  cd yuicompressor

  ant
}

package() {
  cd yuicompressor

  install -dm 755 "${pkgdir}"/usr/{bin,share/java/yuicompressor}
  install -m 755 build/yuicompressor-${pkgver/.r*/}.jar "${pkgdir}"/usr/share/java/yuicompressor/yuicompressor.jar

  echo '#!/bin/sh
  "$JAVA_HOME/bin/java" -jar /usr/share/java/yuicompressor/yuicompressor.jar $@' > "${pkgdir}"/usr/bin/yuicompressor
  chmod +x "${pkgdir}"/usr/bin/${pkgname%-*}

  install -dm 755 "${pkgdir}"/usr/share/licenses/yuicompressor
  install -m 644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/yuicompressor/
}

# vim: ts=2 sw=2 et:
