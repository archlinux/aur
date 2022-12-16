# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.7.1
_pkgver=0.7.1-0.vdb.2
pkgrel=1
pkgdesc='A keyboard layout switcher for X Window System and Wayland'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL3')
depends=('dconf' 'glibmm' 'libinput' 'libxtst')
makedepends=('perl-path-tiny')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('b3692efb4576109947721cee65e9e5623d62f20dc7b78fcc57e8bb2f899ce4aa')

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
