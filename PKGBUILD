# Maintainer: Chih-Hsuan Yen <base64_decode("eWFuMTIxMjUgQVQgYXJjaGxpbnV4IERPVCBvcmc=")>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-runner
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc="The LXQt application launcher"
arch=("i686" "x86_64")
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('layer-shell-qt' 'kwindowsystem' 'lxqt-globalkeys-git' 'muparser')
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
