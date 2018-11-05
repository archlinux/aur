# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>

pkgname=('scala211')
pkgver=2.11.12
conflicts=('scala')
provides=('scala')
pkgrel=2
pkgdesc="A Java-interoperable language with object-oriented and functional features"
arch=('any')
url="http://www.scala-lang.org"
license=('BSD')
depends=('java-environment>=6' 'java-environment<=9' 'java-runtime>=6' 'java-runtime<=9')
optdepends=('graphviz: generate diagrams')
source=("https://downloads.lightbend.com/scala/${pkgver}/scala-${pkgver}.tgz"
        "java_home.patch")
md5sums=('853bfdd9d89a99b2b54ad4e04111b88c'
         'f64384f5b55e9bbb8bf1b7c4cf2bd47b')
sha256sums=('b11d7d33699ca4f60bc3b2b6858fd953e3de2b8522c943f4cda4b674316196a8'
            '7888e98c4082217771803cee27d4d61b6606ce8d44990ede410d902603aded0b')

prepare() {
  patch -p1 -d "scala-${pkgver}" < java_home.patch
}

package() {
  cd "scala-${pkgver}"
  install -d "${pkgdir}/usr/share/scala"

  cp -r bin lib "${pkgdir}/usr/share/scala/"
  cp -r man "${pkgdir}/usr/share/"

  rm $pkgdir/usr/share/scala/bin/*.bat

  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/scala/bin/fsc" "${pkgdir}/usr/bin/fsc"
  ln -s "/usr/share/scala/bin/scala" "${pkgdir}/usr/bin/scala"
  ln -s "/usr/share/scala/bin/scalac" "${pkgdir}/usr/bin/scalac"
  ln -s "/usr/share/scala/bin/scalap" "${pkgdir}/usr/bin/scalap"
  ln -s "/usr/share/scala/bin/scaladoc" "${pkgdir}/usr/bin/scaladoc"

  install -d "${pkgdir}/usr/share/licenses/scala"
  install -Dm644 doc/licenses/*.txt "${pkgdir}/usr/share/licenses/scala"
  install -Dm644 "doc/LICENSE.md" "${pkgdir}/usr/share/licenses/scala/LICENSE.md"
}
