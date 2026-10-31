# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Co-Maintainer: Chih-Hsuan Yen <base64_decode("eXUzYWN0eHQydHR0ZmlteEBjaHllbi5jYwo=")>

_pkgname=obconf-qt
pkgname=$_pkgname-git
pkgver=0.16.6.11.gc738c96
pkgrel=1
pkgdesc="Openbox configuration tool. Qt port of ObConf"
arch=("i686" "x86_64")
url="http://lxqt.org"
# See discussions about the license at https://github.com/lxqt/obconf-qt/issues/210
license=("GPL-2.0-or-later")
depends=("hicolor-icon-theme" "openbox" "qt6-base")
makedepends=("git" "cmake" "qt6-tools" "lxqt-build-tools-git")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/./g"
}

build() {
  mkdir -p build
  cd build
  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
