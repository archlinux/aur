# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=0.7.3
pkgrel=2
pkgdesc="Tom's LADSPA Plugins"
arch=('x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL2')
groups=('ladspa-plugins')
depends=('ladspa')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c4e9c93b9fd8afb82067cf3a48ae665843da775c3af6124147ff1f8651d96734a4b961c4c5ea48877b32770e6d0b5a793af32a5cbb6e3b9afd5b59c8b3cc2621')

prepare() {
  cd "${pkgname}-${pkgver}"
  # correct install path
  sed 's|/usr/local/|$(DESTDIR)/usr/|' -i Makefile
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 CREDITS "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
