# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi dot net>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=swagger-codegen
pkgver=3.0.80
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
sha256sums=('386235163329de6ab7d6d4c5d9532940f3c732ef085d415a92850834706950de'
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
