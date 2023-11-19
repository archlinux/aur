# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.2.0
pkgrel=1
pkgdesc='Get notifications and unread messages count from ProtonMail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client' 'python-gobject' 'python-dasbus')
makedepends=('poetry' 'python-pip')
optdepends=('python-pysocks: support for proxies')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('68f9dd2dc561828d8a6936032fa81a203ed59623a7b8c980f03fa69a6b26f794e48bcb000017c0b402650fe940460c35e03c54eb8fcfb1653d0f7f58ea7f2faf')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
