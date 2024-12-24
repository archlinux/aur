# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-gmail
pkgver=1.0.6
pkgrel=2
pkgdesc='Get notifications and unread messages count from Gmail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-gmail'
license=('MIT')
depends=('python-google-api-python-client' 'python-google-auth-httplib2' 'python-google-auth-oauthlib' 'python-gobject' 'python-dasbus')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-gmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('e27add0cb279a4ff3bc1ce92c6d10b53e25adc80a73eddbde7a95d1d32d06c0b06367f57ef79da20c99cf0f88750dcba261ba9e84900d2cb3efec02b3068f6c0')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
