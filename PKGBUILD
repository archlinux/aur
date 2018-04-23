# Maintainer:
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.9
pkgrel=6
pkgdesc="Converts Psion 5(MX) files to more commonly used file formats"
arch=('x86_64')
url="http://software.frodo.looijaard.name/psiconv/"
license=('GPL')
depends=('graphicsmagick')
makedepends=('bc')
backup=('etc/psiconv/psiconv.conf')
source=("http://www.frodo.looijaard.name/system/files/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('286e427b10f4d10aaeef1944210a2ea6')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|Magick-config|GraphicsMagick-config|g' -i configure.in
  autoreconf -vi
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
