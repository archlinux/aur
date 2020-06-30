# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=fonts-tlwg
pkgver=0.7.2
pkgrel=2
pkgdesc='Collection of scalable Thai fonts'
url='https://github.com/tlwg/fonts-tlwg/'
arch=('any')
license=('GPL' 'custom')
makedepends=('fontforge')
source=("https://github.com/tlwg/fonts-tlwg/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('07cdb99b4ccd4c1cf03be24c399718ac1489a855')

conflicts=('ttf-tlwg')
provides=('ttf-tlwg')
replaces=('ttf-tlwg')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-ttf \
    --disable-otf \
    --with-ttfdir=/usr/share/fonts/TTF
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}"/etc/fonts
  mv "${pkgdir}"/usr/share/fontconfig/conf.avail "${pkgdir}"/etc/fonts
  rm -r "${pkgdir}"/usr/share/fontconfig

  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
