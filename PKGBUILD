pkgname=corsaro
pkgver=2.1.0
pkgrel=1
pkgdesc="A software suite for performing large-scale analysis of trace data"
arch=('i686' 'x86_64')
url="https://www.caida.org/tools/measurement/corsaro/"
depends=('libtrace')
license=('GPL2')
source=("https://www.caida.org/tools/measurement/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz"
        remove-missing-header.patch)
md5sums=('f4970360525b5d112a1040a27503e87f'
         'f0b86fa23f427c9a0ba608e7a1b5081d')

build() {
  cd "${pkgname}-${pkgver}"

  msg "Applying remove-missing-header.patch"
  patch -Np0 -i ../remove-missing-header.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
