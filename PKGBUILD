# Maintainer: Lieven Moors <lievenmoors@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
pkgname=tapiir
pkgver=0.7.3
pkgrel=2
pkgdesc="A simple and flexible audio effects processor, inspired by the classical magnetic tape delay systems"
arch=('i686' 'x86_64')
url="http://www.resorama.com/maarten/tapiir/"
license=('GPL')
depends=('jack' 'fltk')
source=(http://www.resorama.com/maarten/files/${pkgname}-${pkgver}.tgz)
md5sums=('0746206a69acb7252ff0ffa9af47cd54')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i s/min_fltk_version=1.1.0/min_fltk_version=1.3.0/ configure
  sed -i s/fl_file_chooser.H/Fl_File_Chooser.H/ src/GUI.cxx
  sed -i s*'LDFLAGS=`fltk-config --ldflags`'*'LDFLAGS=$(echo $(fltk-config --ldflags) | sed s/--as-needed,//)'* configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
