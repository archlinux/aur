# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eduardo Lopes (eduol@gmx.net)

pkgname=gksu
pkgver=2.0.2
pkgrel=6
pkgdesc="A graphical frontend for su"
arch=('x86_64')
url="http://www.nongnu.org/gksu/index.html"
license=('GPL')
depends=('libgksu>=2.0.12' 'xorg-xauth')
makedepends=('gtk-doc' 'intltool')
source=(https://people.debian.org/~kov/gksu/${pkgname}-${pkgver}.tar.gz)
sha256sums=('a1de3dca039d88c195fcdc9516379439a1d699750417f1e655aa2101a955ee5a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-nautilus-extension
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/applications/"
}
