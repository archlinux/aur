# Maintainer: Emilia P. Stoyanova <emiliaps31 at gmail dot com>
pkgname=prismmodelchecker
pkgver=4.10.1
pkgrel=1
pkgdesc="PRISM is a probabilistic model checker, a tool for formal modelling and analysis of systems that exhibit random or probabilistic behaviour"
arch=(x86_64)
url="https://www.prismmodelchecker.org/"
license=('GPL2')
groups=()
conflicts=('prismmodelchecker-git')
depends=(java-environment)
source=("https://github.com/prismmodelchecker/prism/releases/download/v${pkgver}/prism-${pkgver}-linux64-x86.tar.gz")
md5sums=('a2e5c1b0fa47e6add47e1672868e639d')

package() {
  cd "$srcdir"/prism-${pkgver}-linux64-x86

  sed -i 's/^\(PRISM_DIR=\).*/\1"\/usr\/share\/java\/prism\/"/' bin/prism
  sed -i 's/^\(PRISM_DIR=\).*/\1"\/usr\/share\/java\/prism\/"/' bin/xprism

  mkdir -p "$pkgdir"/usr/share/java/prism/

  cp -r bin/ "$pkgdir"/usr/share/java/prism/bin/
  cp -r lib/ "$pkgdir"/usr/share/java/prism/lib/
  cp -r etc/ "$pkgdir"/usr/share/java/prism/etc/

  install -d "$pkgdir"/usr/bin/
  ln -s "/usr/share/java/prism/bin/prism" "${pkgdir}/usr/bin/prism"
  ln -s "/usr/share/java/prism/bin/xprism" "${pkgdir}/usr/bin/xprism"
  ln -s "/usr/share/java/prism/bin/ngprism" "${pkgdir}/usr/bin/ngprism"
  ln -s "/usr/share/java/prism/etc/scripts/prism-auto" "${pkgdir}/usr/bin/prism-auto"
}
