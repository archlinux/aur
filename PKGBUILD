# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt5-git
_gitname=Kvantum
pkgver=0.10.4.r158.gd2903a1
pkgrel=1
pkgdesc="SVG-based Qt5 theme engine plus a config tool and extra themes - git version"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
groups=('qt')
depends=('qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme')
makedepends=('cmake' 'qt5-tools' "git")
optdepends=('adapta-aurorae-theme-git: Matching kwin decorations for KvAdapta and KvAdaptaDark')
conflicts=('kvantum-qt5')
provides=('kvantum-qt5')
source=("git+https://github.com/tsujan/Kvantum.git")
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
	mkdir -p ${pkgdir}/usr/share/doc/kvantum
	cp ChangeLog ${pkgdir}/usr/share/doc/kvantum
	cp COPYING ${pkgdir}/usr/share/doc/kvantum
	cp -r doc ${pkgdir}/usr/share/doc/kvantum
}
