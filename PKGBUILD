# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.7.2
_pkgver=0.7.2-0.vdb.1
pkgrel=1
pkgdesc='A keyboard layout switcher for X Window System and Wayland'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL3')
depends=('dconf' 'glibmm' 'libinput' 'libxtst')
makedepends=('perl-path-tiny' 'perl-json')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('2b49c70840254c885adcbb3438ae90821b9e6664cd16a82cfb96c0fa7b080040')

build() {
  cd ${_pkgname}-${_pkgver}
  [ ! -d _build ] && mkdir _build
  cd _build
  ../configure --prefix=/usr --disable-rpm --disable-html
  make
}

package() {
  cd ${_pkgname}-${_pkgver}
  cd _build
  make DESTDIR="${pkgdir}" install-strip
}
