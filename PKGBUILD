# Maintainer: yubimusubi
pkgbase=citro3d
pkgname=('citro3d-git')
pkgver=r67.2cc0a08
pkgrel=1
pkgdesc="Provides an easy to use stateful interface to the PICA200 GPU of the Nintendo 3DS."
arch=('i686' 'x86_64')
url="https://github.com/fincs/citro3d"
license=('custom:BSD-like')
sha256sums=('SKIP')
depends=('devkitarm' 'ctrulib-git')
makedepends=('git')
options=('!strip' 'staticlibs')

source=("$pkgbase::git+https://github.com/fincs/citro3d.git")

pkgver() {
    cd "$pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgbase"
    unset CFLAGS
    source /etc/profile.d/devkitarm.sh
    make
}

package() {
    cd "$pkgbase"
    source /etc/profile.d/devkitarm.sh

    # Makefile doesn't support DESTDIR so use DEVKITPRO instead
    make DEVKITPRO="$pkgdir/$DEVKITPRO" install
}
