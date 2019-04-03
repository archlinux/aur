# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=fonts-tlwg
pkgver=0.7.1
pkgrel=1
pkgdesc='Collection of scalable Thai fonts'
url='https://linux.thai.net/projects/fonts-tlwg'
arch=('any')
license=('GPL' 'custom')
makedepends=('fontforge')
depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
source=("https://linux.thai.net/pub/thailinux/software/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha1sums=('5a2c2090e92c382170808f5bb7d1518c57b8894e')

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
  mkdir -p "$pkgdir"/etc/fonts
  mv "$pkgdir"/usr/share/fontconfig/conf.avail "$pkgdir"/etc/fonts
  rm -r "$pkgdir"/usr/share/fontconfig

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
