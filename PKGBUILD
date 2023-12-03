# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt5-git
_gitname=Kvantum
pkgver=1.0.10.r37.g85026b95
pkgrel=1
pkgdesc="SVG-based Qt5 theme engine plus a config tool and extra themes"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
groups=('qt')
depends=('qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme' 'kwindowsystem5')
makedepends=('cmake' 'qt5-tools' 'git')
optdepends=('kvantum-qt6-git: Qt6 component for Kvantum theme engine'
            'adapta-aurorae-theme-git: Matching kwin decorations for KvAdapta and KvAdaptaDark'
            'breeze-enhanced-git: Made to match various themes of the Kvantum widget style')
conflicts=('kvantum' 'kvantum-git')
replaces=('kvantum-qt5' 'kvantum' 'kvantum-git')
provides=('kvantum-qt5' 'kvantum' 'kvantum-git')
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
