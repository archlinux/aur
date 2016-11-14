# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=symfony-installer
pkgver=1.5.9
pkgrel=1
pkgdesc='The Symfony installer.'
arch=('any')
url='https://github.com/symfony/symfony-installer'
license=('MIT')
depends=('php')
makedepends=('php-box' 'php-composer')
source=("https://github.com/symfony/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5ab6d4632bd2c9729eb69a0c7990a264b1ef1cd11c08775a43ead5c7477c5b59')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i '/"git-version":/d' box.json
    composer install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    php -d phar.readonly=Off /usr/bin/php-box build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 symfony.phar "$pkgdir"/usr/bin/symfony
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
