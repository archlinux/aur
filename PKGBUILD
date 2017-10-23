# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=fswebcam
pkgver=20140113
pkgrel=2
pkgdesc='Neat and simple webcam app'
arch=('i686' 'x86_64')
url="https://www.sanslogic.co.uk/fswebcam/"
license=('GPL2')
depends=('gd')
backup=("etc/${pkgname}.conf")
source=("${url}/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3ee389f72a7737700d22e0c954720b1e3bbadc8a0daad6426c25489ba9dc3199')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  sed -ri 's/^([^#])/#\1/g' example.conf
  install -Dm644 example.conf "${pkgdir}"/etc/fswebcam.conf
}
