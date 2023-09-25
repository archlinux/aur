# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-gmail
pkgver=1.0.1
pkgrel=1
pkgdesc='Get notifications and unread messages count from Gmail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-gmail'
license=('MIT')
depends=('python-google-api-python-client' 'python-google-auth-httplib2' 'python-google-auth-oauthlib')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-gmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('51b8f0c9a1d0ec69fe0cb12010cba4a1b6de722f01923b9880b15cb216d4d9f18da2b3679219358bebb2d42c6bab836cb496adfeb2130bfc754e8481da1f9dbf')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
