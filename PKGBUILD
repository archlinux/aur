# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=symfony-installer
pkgver=1.5.0
pkgrel=1
pkgdesc='The Symfony installer.'
arch=('any')
url='https://github.com/symfony/symfony-installer'
license=('MIT')
depends=('php')
makedepends=('php-box' 'php-composer')
source=("https://github.com/symfony/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('22b77a2c7f83f9611cd6cd7a7019e462afd8dcc757c5294400277a14a5ff15cb')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i '/"git-version":/d' box.json
    composer install
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    php-box build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 symfony.phar "$pkgdir"/usr/bin/symfony
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
