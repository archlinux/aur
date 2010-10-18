# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=0.80
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2>=2.7.7' 'glib2>=2.26.0')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=(http://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.bz2
        pbm.patch)
md5sums=('eb8d24a6a80888849c9db7f30232ba6a'
         '39fcc08fbd33145684ba97f1f64644c2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/pbm.patch"
  ./configure --prefix=/usr --disable-update-mimedb
  make
  make DESTDIR="${pkgdir}" install
}
