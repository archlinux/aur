# Maintainer: Karl Tarbe <karulont@gmail.com>

pkgname=i3lock-blur
pkgver=2.10
pkgrel=2
pkgdesc="An improved screenlocker based upon XCB and PAM with background blurring filter"
arch=('x86_64')
url="http://github.com/karulont/i3lock-blur/"
license=('MIT')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
options=('docs')
backup=("etc/pam.d/i3lock")
source=("https://github.com/karulont/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('3b6eeff9dd839b66263098be50c23cb878ae9472ce05e4058434173446cc9309cdae04108d599f161b7b7185b526c888c9045d3fba1c12d915f5eb87afc6803c')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  
  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' pam/i3lock

  autoreconf -fi
  ./configure --prefix="$pkgdir/usr/" --sysconfdir="$pkgdir/etc/"
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  make install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

