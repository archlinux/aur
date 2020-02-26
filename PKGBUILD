# Contributor: Marti Raudsepp <marti@juffo.org>
# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=apgdiff
pkgver=2.4
pkgrel=3
pkgdesc="A free PostgreSQL diff tool that is useful for comparison/diffing of database schemas"
url="http://www.apgdiff.com/"
depends=('jre11-openjdk-headless')
makedepends=('maven')
arch=('any')
source=(
  'apgdiff'
  "https://www.apgdiff.com/download/$pkgname-$pkgver-src.zip"
)
sha256sums=(
  '83a43b2759e0dc7ec3c4433ec09aef3aae83bdb3f88321d2578bd35b2ab1119f'
  '8551a3e10c7aae3a04efc5dad655575484b63a3323f07db5e81c50b42d88129c'
)

build() {
  cd "$pkgname-$pkgver"

  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
  export MAVEN_OPTS="-Dmaven.repo.local=$srcdir/.m2"

  mvn package
}

package() {
  install -Dm 644 \
    "$pkgname-$pkgver/target/apgdiff-$pkgver.jar" \
    "$pkgdir/usr/share/apgdiff/apgdiff-$pkgver.jar"

  install -Dm 755 apgdiff "$pkgdir/usr/bin/apgdiff"
}
