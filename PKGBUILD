# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt5-git
_gitname=Kvantum
pkgver=0.10.8.r52.g05c3763
pkgrel=1
pkgdesc="SVG-based Qt5 theme engine plus a config tool and extra themes"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
groups=('qt')
depends=('qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' 'git')
optdepends=('adapta-aurorae-theme-git: Matching kwin decorations for KvAdapta and KvAdaptaDark'
            'breeze-enhanced-git: Made to match various themes of the Kvantum widget style')
conflicts=('kvantum-qt5')
provides=('kvantum-qt5')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
   cd ${srcdir}/${_gitname}

   git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
   cd ${srcdir}/${_gitname}/${_gitname}

   cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
   make
   
}

package() {
   cd ${srcdir}/${_gitname}/${_gitname}
   
   make DESTDIR=${pkgdir}/ install
   install -Dm644 ChangeLog ${pkgdir}/usr/share/doc/kvantum/ChangeLog
   install -Dm644 COPYING ${pkgdir}/usr/share/licenses/kvantum/COPYING
   cp -r doc ${pkgdir}/usr/share/doc/kvantum
   
}
