# Maintainer:  Peter Mattern <pmattern@arcor.de>

_pkgname=lxqt-themes
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc='Themes, graphics and icons for LXQt'
arch=('any')
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('hicolor-icon-theme')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd $_pkgname
      git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
      mkdir -p build
      cd build
      cmake "$srcdir/$_pkgname" -DCMAKE_INSTALL_PREFIX=/usr
      make
}

package() {
      cd build
      make DESTDIR="$pkgdir" install
}
