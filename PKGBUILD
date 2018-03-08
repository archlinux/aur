# Maintainer: Karl Tarbe <karulont@gmail.com>

pkgname=i3lock-blur
pkgver=2.10
pkgrel=3
pkgdesc="An improved screenlocker based upon XCB and PAM with background blurring filter"
arch=('x86_64')
url="http://github.com/karulont/i3lock-blur/"
license=('MIT')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
options=('docs')
backup=("etc/pam.d/i3lock")
source=("git+https://github.com/karulont/$pkgname/#tag=$pkgver")
sha512sums=("SKIP")

build() {
  cd "${srcdir}/$pkgname"
  
  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' pam/i3lock

  autoreconf -fi
  ./configure --prefix="$pkgdir/usr/" --sysconfdir="$pkgdir/etc/"
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make install
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

