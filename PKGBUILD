# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=doas
pkgver=6.2p2
pkgrel=1
pkgdesc="Port of OpenBSD's doas(1), an alternative to sudo(1)"
license=('custom: ISC')
url="https://github.com/slicer69/doas"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('pam')
provides=('doas')
replaces=('opendoas' 'opendoas-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'doas.patch'
        'doas-pam')
sha256sums=('b8dc7e3357d12335ab6890d8303523862112416136bb50f170400cf5746dfd16'
            '44c737230bb5dcd797a856c3298a4154d49fea2c1823a0531dcb43076f42caee'
            'f61f6b6d2e495dac44dd0d5ee870edf6d8bacbcc8a5059d74c4b91d2bf5c9d6f')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 "doas-pam" "$pkgdir/etc/pam.d/doas"
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
