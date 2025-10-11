# Maintainer: Lukas W. <lukaswhl at gmail dot com>

_basename=tablet-mode
pkgbase=chuwi-hi10-max-tablet-mode-dkms
pkgname=(${pkgbase}-git)
pkgver=r12.683dfae
pkgrel=1
pkgdesc="Kernel module for Chuwi Hi10 Max tablet mode detection"
arch=('x86_64')
url="https://github.com/aligator/tablet-mode"
license=('GPL')
depends=(dkms)
makedepends=('git')
provides=("tablet-mode=$pkgver-$pkgrel")
conflicts=(tablet-mode)
source=('git+https://github.com/aligator/tablet-mode.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_basename}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_basename}"

    install -Dt "$pkgdir/usr/src/$_basename-$pkgver" -m644 Makefile tablet-mode.c "$srcdir/../dkms.conf"
    echo tablet-mode | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$_basename.conf"
}
