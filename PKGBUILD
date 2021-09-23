# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Alucryd <alucryd at gmail dot com>

_pkgname=testng
pkgname=java-${_pkgname}
pkgver=7.4.0
pkgrel=1
pkgdesc='A testing framework inspired by JUnit and NUnit'
arch=('any')
url="http://testng.org"
license=('Apache')
depends=('jdk8-openjdk')
makedepends=('gradle')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cbeust/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('759e17bcc1922512a194ed374b4401556f933e05e4b76bac8a7a5fcc0384e353')

prepare() {
  echo "It's recommended to build in a clean chroot"
  unset _JAVA_OPTIONS
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  gradle --daemon clean build
}

package() {
  install -Dm644 \
    "$srcdir/$_pkgname-$pkgver/build/libs/$_pkgname-$pkgver.jar" \
    "$pkgdir/usr/share/java/$_pkgname/$_pkgname-$pkgver.jar"
}
