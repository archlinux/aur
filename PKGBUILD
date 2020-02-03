# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>

pkgname=xkeycaps-debian
pkgver=2.47
pkgrel=2
arch=('x86_64')
pkgdesc='A graphical front-end to xmodmap, version from debian'
url="https://www.jwz.org/xkeycaps/"
license=('custom')
depends=('libxaw')
conflicts=('xkeycaps')
provides=('xkeycaps')
makedepends=('imake' 'xbitmaps')
source=(http://deb.debian.org/debian/pool/main/x/xkeycaps/xkeycaps_${pkgver}.orig.tar.gz
	license.txt)
sha512sums=('f5f5ecdf83c2bd86eb3d8b8a28b26af25a2dc9ff0a9c44091d8eb154d617b4373191a2e4479bb0e3025c023d6e5d785a088c64bc269c1c43431a3d2fc91c1a7e'
            'dc07c0ff12bb103bcb42911977849c586364ba39cf171d3761c37e69131a933545d6b149b1ced8ff9fd9dd0dfc81bad9ac39e26c22c867fca38f85ccdff74220')

build() {
  cd ${pkgname%-debian}-$pkgver
  xmkmf
  make MANPATH=/usr/share/man
}

package() {
  cd ${pkgname%-debian}-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" MANPATH=/usr/share/man install.man
  install -Dm644 ../license.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
