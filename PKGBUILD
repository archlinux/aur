# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-session
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc="LXQt session"
arch=("i686" "x86_64")
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('procps-ng' 'layer-shell-qt' 'kwindowsystem' 'xdg-user-dirs' 'qtxdg-tools-git' 'liblxqt-git')
optdepends=('sddm: The recommended LXQt display manager')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
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
