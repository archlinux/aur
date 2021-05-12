pkgname=sakura-gtk2
_pkgname=sakura
pkgver=2.4.2
pkgrel=4
pkgdesc="A terminal emulator based on GTK and VTE with latest GTK2 
release"
arch=('i686' 'x86_64')
url="https://github.com/dabisu/sakura"
license=('GPL')
depends=('vte-legacy' 'libxft' 'desktop-file-utils' 'vte-common')
makedepends=('cmake')
provides=('sakura')
conflicts=('sakura')
source=(https://github.com/dabisu/sakura/archive/refs/tags/SAKURA_2_4_2.tar.gz)
install=sakura.install

md5sums=('ce573935677787dac2e01fbf5b9f20b1')

build() {
  cd $srcdir/${_pkgname}-${pkgver}

  # Set default font size a bit smaller
  sed -i 's|#define DEFAULT_FONT "Bitstream Vera Sans Mono 14"|#define DEFAULT_FONT "Bitstream Vera Sans Mono 10"|g' src/sakura.c
  
  # build & install	
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . 
  make 
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install 
  # extract the keybindings from the installed documentation, rest is only relevant during build time
  #awk '/^Keybindings/{f="'${pkgdir}'/usr/share/doc/'${_pkgname}'/KEYBINDINGS"} f{print > f} /^END/' \ ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
  #rm ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
}


