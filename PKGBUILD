# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

pkgname=bar-protonmail
pkgver=1.0.0
pkgrel=1
pkgdesc='Waybar/Polybar module for notifications and unread messages count from ProtonMail'
arch=('any')
url='https://github.com/crabvk/bar-protonmail'
license=('MIT')
depends=('python-proton-client')
makedepends=('python-build' 'python-pip')
source=("https://github.com/crabvk/bar-protonmail/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('c02311e37e7bbe943733829a5bdd9fe1fc825dcbe57548ce18e4dcf14d53876f20179a8a6df1c506a3dc2b86b679d5b8ef027f2337144cabdfb0174f9e0df380')

build() {
    cd $pkgname-$pkgver
    python -m build
}

package() {
    cd $pkgname-$pkgver

    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
