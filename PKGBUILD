pkgname=kmetronome
pkgver=1.3.1
pkgrel=1
pkgdesc="MIDI metronome with KDE interface and based on the ALSA sequencer"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kmetronome/"
license=('GPL')
depends=('alsa-lib' 'drumstick' 'pandoc')
makedepends=('cmake')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6bbd4fb806bcc8161c66d72a17ecaed1')

build() {
          cd "${srcdir}/${pkgname}-${pkgver}"
          #sed -i 's_V4.1.2-Based_V4.2-Based_' doc/index.docbook
          #sed -i 's_dtd/kdex.dtd_customization/dtd/kdex.dtd_' doc/index.docbook
          mkdir build
          cd build
          cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
          make || return 1
}

package() {
	  cd "${srcdir}/${pkgname}-${pkgver}/build"
          make DESTDIR="${pkgdir}" install || return 1
}
