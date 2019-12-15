# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>

_pkgname=freehep-vectorgraphics
pkgname=java-$_pkgname
pkgver=2.4
pkgrel=1
pkgdesc='A vector graphics package'
arch=('x86_64')
license=('LGPL2.1')
depends=('java-runtime')
makedepends=('maven')
url="https://freehep.github.io"
source=("https://codeload.github.com/freehep/$_pkgname/tar.gz/$_pkgname-$pkgver")
sha256sums=('ec24182331283c3b81393c446cbd743a95e24901809dc755a930956798468dee')

prepare() {
  find $srcdir/$_pkgname-$_pkgname-$pkgver -name "pom.xml" \
    -exec sed -i "s/2.3.1-SNAPSHOT/2.4/g" {} +
}

build() {
  cd $srcdir/$_pkgname-$_pkgname-$pkgver
  mvn -DskipTests=true clean package
}

package() {
  install -dm755 $pkgdir/usr/share/java
  cd $srcdir/$_pkgname-$_pkgname-$pkgver
  for file in `find . -maxdepth 3 -name "freehep*.jar" | xargs`; do
    install -Dm644 ${file} \
      $pkgdir/usr/share/java/$( echo $file | sed "s@/target@@g" )
  done
}
