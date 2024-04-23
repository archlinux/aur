# Maintainer:  Peter Mattern <pmattern@arcor.de>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-panel
pkgname=$_pkgname-git
pkgver=2.0.0
pkgrel=1
pkgdesc='The LXQt desktop panel'
arch=('i686' 'x86_64')
url='https://github.com/lxqt/lxqt-panel'
license=("LGPL-2.1-only")
depends=('libstatgrab' 'libsysstat-git' 'libxtst' 'alsa-lib' 'libpulse'
         'layer-shell-qt' 'solid' 'kwindowsystem'
         'libdbusmenu-lxqt-git' 'liblxqt-git' 'lxqt-menu-data-git' 'lxqt-globalkeys-git')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
      cd "$srcdir/$_pkgname"
      git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
      mkdir -p build
      cd build
      cmake "$srcdir/$_pkgname" \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_LIBDIR=/usr/lib
      make
}

package() {
      cd build
      make DESTDIR="$pkgdir" install
}
