# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=hatop
pkgver=0.7.7
pkgrel=1
pkgdesc="HATop is an interactive ncurses client for the HAProxy unix socket"
arch=('x86_64')
url="http://feurix.org/projects/hatop/"
license=('GPL3')
depends=('python2')
# The original source was hosted on Google Code and is no longer available
source=("http://archive.ubuntu.com/ubuntu/pool/universe/h/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")

build(){
  cd "${pkgname}-${pkgver}"

  # HATop is not compatible with python3, so we need to force it to use python2
  sed -i 's;#!/usr/bin/env python;#!/usr/bin/env python2;' 'bin/hatop'
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 "bin/hatop" "${pkgdir}/usr/bin/hatop"
  install -Dm 644 "man/hatop.1" "${pkgdir}/usr/share/man/man1/hatop.1"
  gzip "${pkgdir}/usr/share/man/man1/hatop.1"
}
sha512sums=(879de0e13af1d1c4e86be034066fb4bbc5c1700a30abebbfb1e1d524fb50cec0fa90fe160a7b7d00bf6aedd49ab7bb8fa1447f751fae95200e850ff506feb074)
