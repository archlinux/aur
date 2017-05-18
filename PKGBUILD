# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=5.0.0
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="http://deployer.org/"
license=('MIT')
depends=('php')
makedepends=('composer')
source=("https://github.com/deployphp/deployer/archive/v$pkgver.tar.gz")
sha256sums=('d57549723a973759ef3fd5c9ae1824e68910cf4aa848d60640d166a24dcdf2c4')

prepare() {
    cd "${srcdir}/${pkgname}"
    composer install --prefer-dist --no-dev
}

build() {
    cd "${srcdir}/${pkgname}"
    php -d phar.readonly=Off bin/build -v"$pkgver"
    chmod +x deployer.phar
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0755 deployer.phar "$pkgdir/usr/bin/dep"
}
