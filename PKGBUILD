# Maintainer: Patrik Plihal <patrik dot plihal at gmail dot com>
# Contributor: KokaKiwi <kokakiwi+aur [at] kokakiwi dot net>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=swagger-codegen
pkgver=3.0.77
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
sha256sums=('0bfe29217773f4b64f516867ff421e11ec427b93d5506967751a948cddb73ac4'
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
