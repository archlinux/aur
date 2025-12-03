# Maintainer: whiteman808 <whiteman808 at paraboletancza dot org>
pkgname=msi-keyboard-git
pkgver='r6.9336442'
pkgrel=2
pkgdesc="Utility to control MSI Steelseries keyboards, written in C++"
arch=('x86_64')
url="https://github.com/makkarpov/msi-keyboard"
license=('BSD')
depends=('hidapi')
makedepends=('git')
provides=('msi-keyboard')
source=("$pkgname::git+https://github.com/makkarpov/msi-keyboard.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i '/#include <iostream>/a #include <cstring>' main.cpp 
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 msi-keyboard "$pkgdir/usr/bin/msi-keyboard"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 99-msi-keyboard.rules "$pkgdir/usr/lib/udev/rules.d/99-msi-keyboard.rules"
}
