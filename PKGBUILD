# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.2.1
pkgrel=1
pkgdesc='Get notifications and unread messages count from ProtonMail (Waybar/Polybar module)'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client' 'python-gobject' 'python-dasbus')
makedepends=('poetry' 'python-pip')
optdepends=('python-pysocks: support for proxies')
source=("$pkgname-$pkgver.tar.gz::https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('10eab77522b5b5690d0b28ee65fa35a62c321956e229eeb547dbc749d425b8edcf896d3dd47ce1c7badf8493d8fc598db1806a359792004fd47980e64cedb546')

build() {
    cd $pkgname-$pkgver
    poetry build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
