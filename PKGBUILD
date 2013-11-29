pkgname=soqt-hg
pkgver=20100809
pkgrel=2
pkgdesc="SoQt is a library which provides the glue between Coin and Qt. Provides of SoQT and SoQT-Doc"
arch=('i686' 'x86_64')
url="http://www.coin3d.org/lib/soqt/"
license="GPL"
depends=('coin' 'qt' 'libxmu')
makedepends=('gcc' 'doxygen' 'coin')
provides=('soqt' 'soqt-doc')
conflicts=('soqt' 'soqt-doc')
replaces=()
backup=()
options=('!makeflags')
install=

_soqtrev=bb2d3916586f
_soguirev=239bd7ae533d
_soanydatarev=fba431fe9560

source=("http://hg.sim.no/SoQt/default/archive/${_soqtrev}.tar.bz2" \
        "http://hg.sim.no/SoGUI/default/archive/${_soguirev}.tar.bz2" \
        "http://hg.sim.no/SoAnyData/default/archive/${_soanydatarev}.tar.bz2")

md5sums=('32a722141d4e50d1cfafe675d5c2cc38'
         '5e6c73f965c8f53403ccdfc6ae3f3253'
         '5f8f5869de97eedf3f814bdc895d2676')


build() {
  cd ${srcdir}/default-${_soqtrev}
  cp -r ${srcdir}/default-${_soguirev} src/Inventor/Qt/common
  cp -r ${srcdir}/default-${_soanydatarev} data

  cd build
  ../configure --prefix=/usr --enable-optimization \
    --enable-threadsafe --enable-html --enable-man --enable-exceptions \
    --disable-debug --disable-maintainer-mode --disable-dependency-tracking \
    --enable-shared --disable-static --with-qt=/usr

  make DESTDIR=${pkgdir} install || return 1
  #rm -f ${pkgdir}/usr/lib/libSoQt.la
}
