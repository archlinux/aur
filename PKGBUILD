# Maintainer: Francois Garillot <francois[at]garillot.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

pkgbase=scala_2.10
pkgname=(scala_2.10 scala-docs_2.10 scala-sources_2.10)
pkgver=2.10.5
pkgrel=1
pkgdesc="A Java-interoperable language with object-oriented and functional features. This is the maintenance version of Scala 2.10."
arch=('any')
url="http://www.scala-lang.org"
license=('BSD')
# for Java 8 incompatibility, see scala issue SI-8852
depends=('java-runtime<=7')
conflicts=('scala' 'scala-docs' 'scala-sources')
source=("http://www.scala-lang.org/files/archive/scala-${pkgver}.tgz"
        "http://www.scala-lang.org/files/archive/scala-docs-${pkgver}.txz")
md5sums=('79c0f6551ce62d651f700073e654e141'
         'e895c4641ad8fba4b8a983c957bae948')

package_scala_2.10() {
  depends=('java-runtime<=7')
  replaces=('scala')
  optdepends=('scala-docs_2.10' 'scala-sources_2.10' 'graphviz: generate diagrams')

  cd ${srcdir}/${pkgbase%_2.10}-${pkgver}

  install -d ${pkgdir}/usr/{bin,share} ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/scala/{bin,lib}
  cp -r {lib,misc} ${pkgdir}/usr/share/scala/
  cp -r man ${pkgdir}/usr/share/
  install -m 755 bin/{fsc,scala,scalac,scalap,scaladoc} ${pkgdir}/usr/share/scala/bin
  install -D -m0644 doc/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  ln -s ../share/scala/bin/fsc ${pkgdir}/usr/bin/fsc
  ln -s ../share/scala/bin/scala ${pkgdir}/usr/bin/scala
  ln -s ../share/scala/bin/scalac ${pkgdir}/usr/bin/scalac
  ln -s ../share/scala/bin/scalap ${pkgdir}/usr/bin/scalap
  ln -s ../share/scala/bin/scaladoc ${pkgdir}/usr/bin/scaladoc
}

package_scala-docs_2.10() {
  replaces=('scala-doc' 'scala-devel-docs' 'scala-docs')
  pkgdesc="Scala documentation"
  depends=()

  cd ${srcdir}
  mkdir -p $pkgdir/usr/share/doc/
  cp -r scala-docs-${pkgver} $pkgdir/usr/share/doc/scala
  install -D -m0644 ${srcdir}/${pkgbase%_2.10}-${pkgver}/doc/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_scala-sources_2.10() {
  replaces=('scala-src' 'scala-sources')
  pkgdesc="Scala sources"
  depends=()

  cd ${srcdir}/${pkgbase%_2.10}-${pkgver}
  mkdir -p $pkgdir/usr/share/scala/
  cp -r src $pkgdir/usr/share/scala/src
  install -D -m0644 doc/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
