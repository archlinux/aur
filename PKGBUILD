# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi dot net>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=swagger-codegen
pkgver=3.0.82
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
sha256sums=('abc67e5fb42ddf47d26d670065a1acb996a22f9ea408b7a322240805ab54c07d'
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
