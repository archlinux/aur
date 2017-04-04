# Maintainer: Simon Doppler (dopsi) <dop.simon_at_gmail.com>

# Former maintaining team :
# (Contributor) Nick B <Shirakawasuna at gmail _dot_com>
# (Maintainer) moostik <mooostik_at_gmail.com>
pkgname=qelectrotech
pkgver=0.5
pkgrel=1
pkgdesc="An electric diagram editor"
arch=('i686' 'x86_64')
url="https://qelectrotech.org/"
install='qelectrotech.install'
license=('GPL2')
depends=('qt5-svg' 'desktop-file-utils' 'hicolor-icon-theme' 'shared-mime-info' 'xdg-utils')
md5sums=('6fdf6d0a9fa7437e3555d5a940e1a1e3' '757db940a4e189b9b0aae59131cb26d0')
source=("http://download.tuxfamily.org/qet/tags/20151127/${pkgname}-${pkgver}-src.tar.gz" 'install-dir.patch')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}-src
	patch -p1 < $startdir/install-dir.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  qmake-qt5
  make -j8
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-src
  make INSTALL_ROOT=${pkgdir} install
}
