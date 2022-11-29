# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.0.1
pkgrel=2
pkgdesc='Waybar/Polybar module for notifications and unread messages count from ProtonMail'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client')
makedepends=('poetry' 'python-pip')
source=("https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d79ab662d2436305e0238ac3d9083b0bebe475bb4670b6f443f09e4eb605504803787849d927e89b89bc09705416df394943bf5f7b66336c2a31a89756e140dc')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
