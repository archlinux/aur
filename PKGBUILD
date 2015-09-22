pkgname=sakura-gtk2
_pkgname=sakura
pkgver=2.4.2
pkgrel=3
pkgdesc="A terminal emulator based on GTK and VTE with latest GTK2 
release"
arch=('i686' 'x86_64')
url="http://www.pleyades.net/david/projects/sakura"
license=('GPL')
depends=('vte' 'libxft' 'desktop-file-utils')
makedepends=('cmake')
provides=('sakura')
conflicts=('sakura')
source=(http://pleyades.net/david/projects/$_pkgname/$_pkgname-$pkgver.tar.bz2)
install=sakura.install

md5sums=('46669519c77f7402b2de24cdefe251bb')

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


