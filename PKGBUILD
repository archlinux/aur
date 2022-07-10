# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=strata
pkgname=java-$_pkgname
_PkgName=Strata
pkgver=2.12.5
pkgrel=1
pkgdesc='Open source analytics and market risk library from OpenGamma'
arch=('any')
url="http://strata.opengamma.io"
license=('Apache')
depends=('jdk8-openjdk')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenGamma/Strata/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac9e9826a2a83a54b54071307223f50323fb74435666944b82869a1129e2a9d2')

prepare() {
  unset _JAVA_OPTIONS
}

build() {
  cd "$srcdir/$_PkgName-$pkgver"
  mvn clean package -Dmaven.test.skip=true
}

check() {
  cd "$srcdir/$_PkgName-$pkgver"
  mvn test
}

package() {
  cd "$srcdir/$_PkgName-$pkgver/modules"

  install -Dm644 \
    {basics,calc,collect,data,loader,market,math,measure,product,pricer,report}/target/*.jar \
    -t "$pkgdir/usr/share/java/$_pkgname"
}
