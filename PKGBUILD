# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=symfony-installer
pkgver=1.5.6
pkgrel=1
pkgdesc='The Symfony installer.'
arch=('any')
url='https://github.com/symfony/symfony-installer'
license=('MIT')
depends=('php')
makedepends=('php-box' 'php-composer')
source=("https://github.com/symfony/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6cc15a8ff0f828d43251453c83b6e86dac9142e2d8e7d7f8d156cc7173623953')

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
