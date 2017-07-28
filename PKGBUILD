# Maintainer: Mikołaj Chwalisz <m.chwalisz@gmail.com>

_appname_=plantuml
pkgname=${_appname_}-pdf
pkgver=1.2017.15
pkgrel=2
pkgdesc="Component that allows to quickly write uml diagrams, with PDF support."
arch=(any)
url="http://plantuml.com/"
license=('GPL')
depends=("java-runtime>=8" "graphviz")
makedepends=("apache-ant" "java-environment>=8")
provides=("${_appname_}")
conflicts=("${_appname_}")
source=("http://downloads.sourceforge.net/project/${_appname_}/$pkgver/${_appname_}-$pkgver.tar.gz"
        "http://apache.mirror.digionline.de/xmlgraphics/batik/binaries/batik-bin-1.9.tar.gz"
        "http://apache.mirror.digionline.de/xmlgraphics/fop/binaries/fop-2.2-bin.tar.gz"
        "${_appname_}.run")
sha256sums=('f33a1d0781eaa3eb101043a965053ac44f1e12cc277b60fc8a5046f766b3a38b'
            '349bf6a4f02ce9f631248b224994e20ffc263fe65c1673c9180daa3584418b75'
            '9dc1f9d1cb9acf5b3352116924c0b7678a88703b1214d537bc027c6867ec4dfe'
            '7c5fec987bd3030dc9efa4ca65719e43edaaba631f1e6f0b5af8e1578d9c4f69')

package() {
  install -m 755 -D "${_appname_}.run" "$pkgdir/usr/bin/${_appname_}"

  cd "$srcdir/${_appname_}-$pkgver"
  sed 's/target="1.6"/target="1.8"/g' -i build.xml
  ant dist
  install -m 644 -D "${_appname_}.jar" "$pkgdir/opt/${_appname_}/${_appname_}.jar"

  cd "$srcdir/batik-1.9/"
  install -m 644 -D *.jar "$pkgdir/opt/${_appname_}/"

  cd "$srcdir/fop-2.2/fop/"
  install -m 644 -D build/*.jar "$pkgdir/opt/${_appname_}/"
  install -m 644 -D lib/*.jar "$pkgdir/opt/${_appname_}/"
}
