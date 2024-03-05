# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt6-git
_gitname=Kvantum
pkgver=1.0.10.r51.gf6bfa8fd
pkgrel=1
pkgdesc="SVG-based Qt6 theme engine plus a config tool and extra themes"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL-3.0-or-later')
depends=('qt6-svg' 'hicolor-icon-theme' 'kwindowsystem')
makedepends=('cmake' 'qt6-tools' 'git')
optdepends=('breeze-enhanced-git: Made to match various themes of the Kvantum widget style')
conflicts=('kvantum' 'kvantum-qt5-git' 'kvantum-git')
replaces=('kvantum-qt5' 'kvantum' 'kvantum-git')
provides=('kvantum')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
   cd ${srcdir}/${_gitname}/${_gitname}
   mkdir -p build && cd build
   cmake .. \
         -DCMAKE_INSTALL_PREFIX=/usr
   make

}

package() {
   make -C ${srcdir}/${_gitname}/${_gitname}/build DESTDIR=${pkgdir}/ install

   cd ${srcdir}/${_gitname}/${_gitname}
   install -Dm644 ChangeLog ${pkgdir}/usr/share/doc/kvantum/ChangeLog
   install -Dm644 COPYING ${pkgdir}/usr/share/licenses/kvantum/COPYING
   cp -r doc ${pkgdir}/usr/share/doc/kvantum

}
