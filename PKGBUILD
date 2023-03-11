# Maintainer: Kyle Laker <kyle+aur@laker.email>

pkgname=oscal-cli
pkgver=0.3.2
pkgrel=1
pkgdesc="A simple open source command line tool to support common operations over OSCAL content."
arch=('any')
url="https://github.com/usnistgov/oscal-cli"
license=('custom')
depends=('java-environment>=11')
makedepends=('maven' 'java-environment>=11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('12e2ed6cef6ad8cdd7888a0a4f0aca64a8dae7d054b08163f3b807fca0241a2d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mvn clean package -DskipTests=true
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  mvn test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/opt"
  cp -r "cli-core/target/cli-core-$pkgver-oscal-cli/" "$pkgdir/opt/oscal-cli"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/oscal-cli/bin/oscal-cli "$pkgdir/usr/bin/oscal-cli"
}
