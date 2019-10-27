# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=doas
pkgver=6.2p1
pkgrel=1
pkgdesc="Port of OpenBSD's doas(1), an alternative to sudo(1)"
license=('custom: ISC')
url="https://github.com/slicer69/doas"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('pam')
provides=('doas')
replaces=('opendoas' 'opendoas-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'doas.patch')
sha256sums=('b1c0246ba7cdf0e80dc625d9aed09c3aaa430eb42b271b71ecc36b40052de847'
            '8127bab559742558eb6344c70bdcb2cb82e819cde81e7af60a0390e280cbfd23')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
