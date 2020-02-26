# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=apgdiff-git
pkgver=r355.10c7f37
pkgrel=1
pkgdesc="A free PostgreSQL diff tool that is useful for comparison/diffing of database schemas"
url="http://www.apgdiff.com/"
depends=('java-runtime-common')
makedepends=('git' 'maven')
arch=('any')
conflicts=('apgdiff')
provides=('apgdiff')
source=(
  'apgdiff'
  'apgdiff.git::git+https://github.com/fordfrog/apgdiff.git'
)
sha256sums=(
  'debfb0d66ddb37631a11badf3d43fd95486eb3bba9e1a305290963066d3cb514'
  'SKIP'
)

pkgver() {
  cd apgdiff.git

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd apgdiff.git

  export MAVEN_OPTS="-Dmaven.repo.local=$srcdir/.m2"

  mvn package
}

package() {
  install -Dm 644 \
    apgdiff.git/target/apgdiff-2.6.0-SNAPSHOT.jar \
    "$pkgdir/usr/share/apgdiff/apgdiff-2.6.0-SNAPSHOT.jar"

  install -Dm 755 apgdiff "$pkgdir/usr/bin/apgdiff"
}
