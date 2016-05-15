# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=lxqt-l10n
pkgname=$_pkgname-git
pkgver=0.10.95.1.ga2ce46c
pkgrel=1
pkgdesc="Translations of all components maintained by the LXQt project"
arch=('any')
url='https://github.com/lxde/translations'
license=('LGPL')
makedepends=('git' 'cmake' 'liblxqt-git' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/lxde/translations.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's:-:.:g'
}

build() {
  mkdir -p build
  cd build
  # translations of lxqt-panel and lxqt-sudo are provided by the respective repository for now
  cmake "$srcdir/$_pkgname" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DWITH_LXQT_PANEL=OFF \
      -DWITH_LXQT_SUDO=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
