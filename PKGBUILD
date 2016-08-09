# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=symfony-installer
pkgver=1.5.8
pkgrel=1
pkgdesc='The Symfony installer.'
arch=('any')
url='https://github.com/symfony/symfony-installer'
license=('MIT')
depends=('php')
makedepends=('php-box' 'php-composer')
source=("https://github.com/symfony/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('72d8247530b29494f5db5877d21a65d6c42b386e507ea4089b8a660eb9637d7c')

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
