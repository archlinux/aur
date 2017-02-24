pkgname=kmetronome
pkgver=1.0.0
pkgrel=3
pkgdesc="MIDI metronome with KDE interface and based on the ALSA sequencer"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kmetronome/"
license=('GPL')
depends=('kdelibs' 'alsa-lib' 'phonon-qt4' 'drumstick' 'automoc4')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
source=(http://kent.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('2dc93568c5d3381d39013ef9cf8f50b8')


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
