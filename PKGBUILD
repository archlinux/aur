# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=symfony-installer
pkgver=1.5.1
pkgrel=1
pkgdesc='The Symfony installer.'
arch=('any')
url='https://github.com/symfony/symfony-installer'
license=('MIT')
depends=('php')
makedepends=('php-box' 'php-composer')
source=("https://github.com/symfony/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4b9c852e1fd5bfb1f50856279f1433b1d706ee932a407dfdb9a86f005a01f603')

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
