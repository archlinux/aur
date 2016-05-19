# Maintainer: yubimusubi

_pkgbase=sftdlib
pkgname=${_pkgbase}-git
provides=($_pkgbase)
pkgver=r23.14fb053
pkgrel=1
pkgdesc='Simple and Fast Text Drawing library for the Nintendo 3DS (using sf2dlib and ctrulib)'
arch=('any')
url='https://github.com/xerpi/sftdlib'
license=('MIT')
options=(!strip staticlibs)
depends=('sf2dlib')
makedepends=('git' 'curl')
source=("$pkgname::git+https://github.com/xerpi/sftdlib.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname/libsftd"
    source /etc/profile.d/devkitarm.sh

    make
}

package() {
    cd "$pkgname/libsftd"
    source /etc/profile.d/devkitarm.sh

    # Create necessary directories
    install -d $pkgdir$DEVKITPRO/libctru/lib
    install -d $pkgdir$DEVKITPRO/libctru/include

    # Makefile doesn't support DESTDIR so use DEVKITPRO instead
    make DEVKITPRO="$pkgdir$DEVKITPRO" install
}
