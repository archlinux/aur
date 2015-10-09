# Maintainer: Karl Tarbe <karulont@gmail.com>

pkgname=i3lock-blur
pkgver=2.7.2
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM with background blurring filter"
arch=('i686' 'x86_64')
url="http://github.com/karulont/i3lock-blur/"
license=('MIT')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11')
options=('docs')
backup=("etc/pam.d/i3lock")
source=("git+https://github.com/karulont/$pkgname/#tag=$pkgver")
sha512sums=("SKIP")

build() {
  cd "${srcdir}/$pkgname"
  
  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' i3lock.pam

  make
  gzip i3lock.1
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:

