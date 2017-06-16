# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=5.0.3
pkgrel=2
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="http://deployer.org/"
license=('MIT')
depends=('php')
makedepends=('composer')
source=("https://github.com/deployphp/deployer/archive/v$pkgver.tar.gz")
sha256sums=('b301bd058fb32ce82e210ce2a7d52a7a878b9b6a83d06acacecc64200aea02d9')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    composer install --prefer-dist --no-dev
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    php -d phar.readonly=Off bin/build -v"$pkgver"
    chmod +x deployer.phar
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 deployer.phar "$pkgdir/usr/bin/dep"
}
