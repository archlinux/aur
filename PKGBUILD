# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-gmail
pkgver=1.0.3
pkgrel=1
pkgdesc='Get notifications and unread messages count from Gmail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-gmail'
license=('MIT')
depends=('python-google-api-python-client' 'python-google-auth-httplib2' 'python-google-auth-oauthlib')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-gmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ea705bc3ad14e461d5690096e5d8787f8f734c0632a3cadf36461392a26da447e7c3551c669073adbd76e24cd15032ca46ff06ee64b5e301192f8288b00086cb')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
