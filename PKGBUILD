# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi dot net>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=swagger-codegen
pkgver=3.0.68
pkgrel=1
pkgdesc="Swagger Code Generator"
arch=("any")
url="https://github.com/swagger-api/swagger-codegen"
license=("Apache-2.0")
depends=('java-runtime')
makedepends=('maven')
provides=('swagger-codegen-cli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/swagger-api/swagger-codegen/archive/v$pkgver.tar.gz"
       swagger-codegen)
sha256sums=('05edb52130fe8c7d619338b23693aa284138fac2e73867ce5ab718e21b34ea45'
            'ac1dc1e6661c19572047e7253ddfb5c0861cdae78e2f14105b742fceda2733e3')

build() {
  cd "$pkgname-$pkgver"

  mvn clean package
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0644 modules/swagger-codegen-cli/target/swagger-codegen-cli.jar \
    "$pkgdir/usr/share/swagger-codegen/swagger-codegen-cli.jar"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -Dm0755 -t "$pkgdir/usr/bin" "$srcdir/swagger-codegen"
}

# vim: ft=sh syn=sh et

