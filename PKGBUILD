# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=vym-devel
pkgver=2.8.8
pkgrel=1
pkgdesc="A mindmapping tool"
arch=('i686' 'x86_64')
url="https://www.insilmaril.de/vym/"
license=('GPL')
depends=('zip' 'unzip' 'qt5-svg' 'qt5-script' 'desktop-file-utils' 'hicolor-icon-theme' 'ruby')
makedepends=('qt5-tools')
install=$pkgname.install
source=("https://altushost-swe.dl.sourceforge.net/project/vym/${pkgver}/vym-${pkgver}.tar.bz2"
        vym.desktop)
sha256sums=('405b6d58ea4a201e7aa32f2b65c61d3bec50f914486d02394842bdd7f8f41f08'
            'e299c69c213e7aac3f5b5d0ab088132b4ec7cb63a391f272e75ed64f049d541b')

build() {
  cd "${srcdir}"/vym-${pkgver}
  qmake PREFIX=/usr/share
  make
}

package() {
  cd "${srcdir}"/vym-${pkgver}

# install files
  make INSTALL_ROOT="${pkgdir}" install

# install documentation
  install -Dm644 "${srcdir}"/vym-${pkgver}/doc/vym.1.gz \
  "${pkgdir}"/usr/share/man/man1/vym.1.gz
  install -Dm644 "${srcdir}"/vym-${pkgver}/doc/vym.pdf \
  "${pkgdir}"/usr/share/doc/${pkgname}/vym.pdf
  rm -rf "${pkgdir}"/usr/share/doc/packages

# .desktop and icon file
  install -Dm644 "${srcdir}"/vym.desktop \
  "${pkgdir}"/usr/share/applications/vym.desktop
  install -Dm644 "${pkgdir}"/usr/share/vym/icons/vym.png \
  "${pkgdir}"/usr/share/pixmaps/vym.png

  chmod 644 ${pkgdir}/usr/share/vym/icons/vym.ico

}
