# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.71
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2>=2.7.3' 'glib2>=2.22.2')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2 pbm.patch)
md5sums=('0a90508234d415f761a79fbffdff74f4' '39fcc08fbd33145684ba97f1f64644c2')
sha1sums=('6f3d3379662857646b0c5b95d5d26e47c0b6250a' '1e8f1cf027e0ce4b5a88f0e36f4bab3ff2d320a5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/pbm.patch" || return 1
  ./configure --prefix=/usr --disable-update-mimedb || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
