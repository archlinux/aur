# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.5
pkgrel=3
pkgdesc='Desktop integration portals for sandboxed apps'
arch=('i686' 'x86_64')
url='https://github.com/flatpak/xdg-desktop-portal'
license=('LGPL2.1')
depends=('glib2')
makedepends=('python' 'flatpak' 'xmlto' 'docbook-xsl')
source=(https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('9f4aa2b4bf6b348f0e46d968c92995e7c6f762b831d1b74cc83b5ff5b5836c1f')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=('xdg-desktop-portal-impl')
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
