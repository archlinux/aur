#Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
#Contributor:	Jussi Timperi	<gmail.com: jussi.timperi>

pkgname=malaga
pkgver=7.12
pkgrel=8
pkgdesc="A software for the development and application of grammars that are used for the analysis of words and sentences of natural languages."
arch=('i686' 'x86_64')
url="http://home.arcor.de/bjoern-beutel/malaga/"
license=('GPL2')
depends=()
makedepends=('texinfo')
options=(!libtool)
install=malaga.install
source=(
  http://ftp.funet.fi/pub/mirrors/ftp.debian.org/debian/pool/main/m/malaga/malaga_7.12.orig.tar.gz
  malaga-rename-map_file.diff
)
sha256sums=('8811e5feaae03e1b6e3008116fdc7471a53b6c0c5036751c637b15058f855ace'
            '740f502a00c0fdf1aba14b53fc56a0b1ec7ca6682a9fb83627de28e71938398f')

prepare() {
  cd "${srcdir}"

  patch -p0 < ./malaga-rename-map_file.diff
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Disable the GUI part, as it requires GTK2
  ./configure --prefix=/usr --disable-malshow
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:
