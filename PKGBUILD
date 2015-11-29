pkgname=kndiswrapper-qt5
pkgver=0.4.0
pkgrel=1
pkgdesc='Frontend for ndiswrapper'
url='http://kde-apps.org/content/show.php/KNDISWrapper?content=86885'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'ndiswrapper' 'polkit')
makedepends=('qt5-tools')
provides=kndiswrapper
conflicts=kndiswrapper
source=("http://ftp.riken.jp/Linux/momonga/development/source/SOURCES/kndiswrapper-${pkgver}.tgz" "qt5.patch" "kndiswrapper.gui.policy")
sha1sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/kndiswrapper-${pkgver}"
  patch -p1 -i $srcdir/qt5.patch
}

package() {
  cd "$srcdir/kndiswrapper-${pkgver}"
  ./install.sh "$pkgdir"
  install -Dm755 "${srcdir}/kndiswrapper.gui.policy" "$pkgdir/usr/share/polkit-1/actions/kndiswrapper.gui.policy"
}
