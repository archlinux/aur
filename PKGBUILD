# Maintainer: petRUShka <petrushkin[dot]yandex[at]ru>

pkgname=huaweicalc-git
pkgver=r16.98a2451
pkgrel=1
pkgdesc='Huawei modem unlock code calculator.'
arch=('i686' 'x86_64')
url="https://github.com/forth32/${pkgname%-git}"
license=('GPLv3')
depends=('qt5-base')
makedepends=('make git gcc qtchooser')
provides=()
conflicts=()
options=()

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

source=("${pkgname}::git+https://github.com/forth32/${pkgname%-git}.git")
md5sums=(SKIP)

build() {
    cd $srcdir/$pkgname
    qmake
    make
}

package() {
    cd $srcdir/$pkgname
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 balong_flash "$pkgdir/usr/bin/${pkgname%-git}"
}
