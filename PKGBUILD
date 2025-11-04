# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Antonis G. <capoiosct at gmail dot com>

pkgname='xpad-dkms-git'
pkgver=r127.9caad15
pkgrel=1
epoch=1
pkgdesc='Driver for the Xbox/ Xbox 360/ Xbox 360 Wireless/ Xbox One Controllers'
arch=('any')
url='https://github.com/paroj/xpad'
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=('xpad-dkms')
conflicts=('xpad-dkms')
source=("$pkgname::git+https://github.com/paroj/xpad.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd $pkgname
    install -Dm644 xpad.c "$pkgdir/usr/src/xpad-$pkgver/xpad.c"
    install -Dm644 Makefile "$pkgdir/usr/src/xpad-$pkgver/Makefile"
    install -Dm644 dkms.conf "$pkgdir/usr/src/xpad-$pkgver/dkms.conf"

    sed -i "s/PACKAGE_VERSION=\"0.4\"/PACKAGE_VERSION=\"$pkgver\"/" \
        "$pkgdir/usr/src/xpad-$pkgver/dkms.conf"
}
