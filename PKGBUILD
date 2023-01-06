# Contributor: Marti Raudsepp <marti@juffo.org>
# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=apgdiff
pkgver=2.7.0
pkgrel=1
pkgdesc="A free PostgreSQL diff tool that is useful for comparison/diffing of database schemas"
url="http://www.apgdiff.com/"
depends=('jre11-openjdk-headless')
makedepends=('maven')
arch=('any')
source=(
  'apgdiff'
  "https://github.com/fordfrog/apgdiff/archive/refs/tags/release_$pkgver.tar.gz"
)
sha256sums=(
  'd2a627da0011c69c8698a0e78c7b2bdbd9ed90dbca9050490ba5ec6898cbf1f4'
  '932a7e9fef69a289f4c7bed31a9c0709ebd2816c834b65bad796bdc49ca38341'
)

build() {
  cd "$pkgname-release_$pkgver"

  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
  export MAVEN_OPTS="-Dmaven.repo.local=$srcdir/.m2"

  mvn package
}

package() {
  install -Dm 644 \
    "$pkgname-release_$pkgver/target/apgdiff-$pkgver.jar" \
    "$pkgdir/usr/share/apgdiff/apgdiff-$pkgver.jar"

  install -Dm 755 apgdiff "$pkgdir/usr/bin/apgdiff"
}
