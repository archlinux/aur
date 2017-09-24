# Contributor: Pedram Pourang <tsujan2000@gmail.com>
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=kvantum-qt5-git
pluginname=kvantum
gitname=Kvantum
pkgver=0.10.4.r148.g8130f49
pkgrel=2
pkgdesc="SVG-based Qt5 theme engine plus a config tool and extra themes - git version"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
groups=('qt')
depends=('qt5-base' 'qt5-svg' 'qt5-x11extras' 'libx11' 'libxext>')
makedepends=('cmake' 'qt5-tools' "git")
optdepends=('adapta-aurorae-theme-git: Matching kwin decorations for KvAdapta and KvAdaptaDark')
conflicts=('kvantum-qt5')
provides=('kvantum-qt5')
source=("git+https://github.com/tsujan/Kvantum.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${gitname}

  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${gitname}/${gitname}
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr
	make
}

package() {
	cd ${srcdir}/${gitname}/${gitname}
	make DESTDIR=${pkgdir}/ install
	mkdir -p ${pkgdir}/usr/share/doc/kvantum
	install -Dm664 ChangeLog ${pkgdir}/usr/share/doc/kvantum
	install -Dm664 COPYING ${pkgdir}/usr/share/doc/kvantum
	install -dm755 doc ${pkgdir}/usr/share/doc/kvantum
}
