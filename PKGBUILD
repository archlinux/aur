# Maintainer: Christian Heusel <christian@heusel.eu>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=fswebcam
pkgver=20200725
pkgrel=1
pkgdesc='Neat and simple webcam app'
arch=('i686' 'x86_64')
url="https://www.sanslogic.co.uk/fswebcam/"
license=('GPL2')
depends=('gd')
backup=("etc/${pkgname}.conf")
source=("${url}/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('319a6926507cb52da5043a5ceaea6cc5b949d3acaa5f39fe074327ae58d65fb5')

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
