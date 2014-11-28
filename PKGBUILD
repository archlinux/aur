# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vym-devel
pkgver=2.3.20
pkgrel=1
pkgdesc="A mindmapping tool"
arch=('i686' 'x86_64')
url="http://www.insilmaril.de/vym/"
license=('GPL')
depends=('qt4' 'unzip' 'zip')
conflicts=('vym')
options=('!emptydirs')
install=$pkgname.install
source=(http://downloads.sourceforge.net/sourceforge/vym/vym-$pkgver.tar.bz2 \
        vym.desktop)
sha256sums=('24b1e874fbe2fb8909e9571132f2fb246efddc990d09515da41e50cecf84fb0d'
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
  install -D -m644 "${srcdir}"/vym.desktop \
    "${pkgdir}"/usr/share/applications/vym.desktop
  install -D -m644 "${pkgdir}"/usr/share/vym/icons/vym.png \
    "${pkgdir}"/usr/share/pixmaps/vym.png
}
