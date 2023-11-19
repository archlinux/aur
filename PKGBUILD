# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-gmail
pkgver=1.0.4
pkgrel=1
pkgdesc='Get notifications and unread messages count from Gmail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-gmail'
license=('MIT')
depends=('python-google-api-python-client' 'python-google-auth-httplib2' 'python-google-auth-oauthlib' 'python-gobject' 'python-dasbus')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-gmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('18e942f616097b626480db07422b777978c249eb44d333303ee38b8e15281c224b324ee90f677ca0298c4f7397dccbe1ba72545a0325ec39cc9d541d6c2b021a')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
