# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Josh Hebert <aksr at t-com dot me>
pkgname=msi-keyboard-git
pkgver=r19.fb57be9
pkgrel=2
pkgdesc="Utility to control MSI Steelseries keyboards, written in C++"
arch=('i686' 'x86_64')
url="https://github.com/bparker06/msi-keyboard"
license=('BSD')
depends=('hidapi')
makedepends=('git' 'unzip' 'libusb' 'qt5-base')
provides=('msi-keyboard')
source=("$pkgname::git+https://github.com/bparker06/msi-keyboard")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    qmake
    make
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 msi-keyboard "$pkgdir/usr/bin/msi-keyboard"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 99-msi.rules "$pkgdir/usr/lib/udev/rules.d/99-msi.rules"
}
