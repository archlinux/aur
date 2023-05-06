# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.0.2
pkgrel=1
pkgdesc='Waybar/Polybar module for notifications and unread messages count from ProtonMail'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client')
makedepends=('poetry' 'python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('ee72e7cebbb4c7c2c0e605a0cc5084af6c9946db19de37fc0b49f299e2fc3bc65f83e56f4ea613161e67d08687d6a3b402fa34f1e02b3b9d372ee7e15ce9eae0')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
