# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=strata
pkgname=java-$_pkgname
_PkgName=Strata
pkgver=2.12.28
pkgrel=1
pkgdesc='Open source analytics and market risk library from OpenGamma'
arch=(any)
url="http://strata.opengamma.io"
license=(Apache)
depends=(java-environment)
makedepends=(maven)
source=($pkgname-$pkgver.tar.gz::https://github.com/OpenGamma/Strata/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('2a58ba1d3e98dc1a5f1c6f5ca2eb9016c5745520f4ef9ad6416d45e9e6b562c0')

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
