# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=1.0.0
pkgrel=4
pkgdesc="Tom's LADSPA Plugins"
arch=('x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL2')
groups=('ladspa-plugins' 'pro-audio')
depends=('glibc')
makedepends=('ladspa')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('fc6c6bd394aa3bd6937180a548422de107a5be2ec06338dd107346fd65ceba2ada00835ab53d0491db5cd1744d94a33fe9a80079c9f1d0ca3ef2e127c3b5d549')

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
  install -t "${pkgdir}/usr/share/doc/${pkgname}" -vDm 644 {CREDITS,README}
}
