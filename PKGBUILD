# Maintainer: Mikołaj Chwalisz <m.chwalisz@gmail.com>

_appname_=plantuml
pkgname=${_appname_}-pdf
pkgver=1.2018.1
pkgrel=1
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
        "http://beta.plantuml.net/plantuml-jlatexmath.zip"
        "${_appname_}.run")
sha256sums=('57ea4641cea6db9d2a0e6fd4a111f0f4baa44e1cf29af4698024583fc2c27595'
            '349bf6a4f02ce9f631248b224994e20ffc263fe65c1673c9180daa3584418b75'
            '9dc1f9d1cb9acf5b3352116924c0b7678a88703b1214d537bc027c6867ec4dfe'
            'e041164c6dce5dec3377242a0664c1855d863094dd51c28880888f59820fc7e2'
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

  cd "$srcdir/"
  install -m 644 -D jlatexmath-*.jar "$pkgdir/opt/${_appname_}/"
  install -m 644 -D jlm_*.jar "$pkgdir/opt/${_appname_}/"
}
