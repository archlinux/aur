# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=winpager
pkgname=${_pkgname}-git
pkgver=20150225.r21.69466f0
pkgrel=1
pkgdesc="A dynamic window paging system for X.Org"
url="https://github.com/prurigro/winpager"
license=('MIT')
arch=('any')
depends=('wmctrl' 'xorg-xwininfo' 'xorg-xprop')
makedepends=('git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Install the winpager files
    cd $_pkgname
    make DESTDIR="$pkgdir" PREFIX=/usr install

    # Insatll the license
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
