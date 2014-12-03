# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vym-devel
pkgver=2.3.24
pkgrel=1
pkgdesc="A mindmapping tool"
arch=('i686' 'x86_64')
url="http://www.insilmaril.de/vym/"
license=('GPL')
depends=('qt4' 'unzip' 'zip')
conflicts=('vym')
options=('!emptydirs')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/vym/vym-$pkgver.tar.bz2
        vym.desktop)
sha256sums=('b719521b97cd1cf1ab881a46325519bd9c48191537eadac8d4251a08a0741e06'
            'e299c69c213e7aac3f5b5d0ab088132b4ec7cb63a391f272e75ed64f049d541b')

build() {
  cd "${srcdir}"/vym-$pkgver

  qmake-qt4 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/vym-$pkgver

# install files
  make INSTALL_ROOT="${pkgdir}" install

# correct doc location
  install -d "${pkgdir}"/usr/share/doc/vym
  install -m644 doc/* "${pkgdir}"/usr/share/doc/vym
  rm -rf "${pkgdir}"/usr/share/doc/packages

# .desktop and icon file
  install -Dm644 "${srcdir}"/vym.desktop \
    "${pkgdir}"/usr/share/applications/vym.desktop
  install -Dm644 "${pkgdir}"/usr/share/vym/icons/vym.png \
    "${pkgdir}"/usr/share/pixmaps/vym.png
}
