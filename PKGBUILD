# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.0.1
pkgrel=1
pkgdesc='Waybar/Polybar module for notifications and unread messages count from ProtonMail'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client')
makedepends=('poetry' 'python-pip')
source=("https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('15ce7a195e121e84093253db9b293cbdfd2993ec5392a1613a37645cc606acaf7dbf90253ebd8d8318750c2035ef7e5f9e0178ef5f111fc0a44eef260c619081')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
