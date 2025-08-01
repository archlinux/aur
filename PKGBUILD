# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=mpssh
pkgver=1.3.3
pkgrel=3
pkgdesc='Mass Parallel SSH'
arch=(x86_64 i686)
url='https://github.com/ndenev/mpssh'
license=('custom:BSD')
depends=('openssh')
optdepends=()
source=("${url}/archive/${pkgver}.tar.gz"
        sighandler.patch
        LICENSE)
sha256sums=('510e11c3e177a31c1052c8b4ec06357c147648c86411ac3ed4ac814d0d927f2f'
            'acc2e3cc2734d50477a5ee86a1a725ce7a4dd92b1b692d346c12ec0560d205dd'
            'e0d023245f3f48e1706762050140186363e01dbb09c96827d379ad70f0b185a6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 < ../sighandler.patch
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/mpssh" "$pkgdir/usr/bin/mpssh"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
