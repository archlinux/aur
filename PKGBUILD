# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Patrick Griffis <tingping@tingping.se>

pkgname=xdg-desktop-portal
pkgver=0.6
pkgrel=1
pkgdesc='Desktop integration portals for sandboxed apps'
arch=('i686' 'x86_64')
url='https://github.com/flatpak/xdg-desktop-portal'
license=('LGPL2.1')
depends=('glib2')
makedepends=('python' 'flatpak' 'xmlto' 'docbook-xsl')
source=(https://github.com/flatpak/xdg-desktop-portal/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('fbaa92c1761167a1d9bd54232843dcf8cf53bb6e47709c7bda0fa89804a1c8e5')

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
