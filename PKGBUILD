# Maintainer: Pierpaolo Valerio <gondsman@techgeek.co.in>
# PKGBUILD created from the original kvantum-qt5-git AUR entry

pkgname=kvantum-qt4-git
_gitname=Kvantum
pkgver=0.10.5.r16.g45792f7
pkgrel=1
pkgdesc="SVG-based Qt4 theme engine plus a config tool and extra themes"
arch=('x86_64')
url="https://github.com/tsujan/Kvantum"
license=('GPL3')
groups=('qt')
depends=('qt4' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
optdepends=('adapta-aurorae-theme-git: Matching kwin decorations for KvAdapta and KvAdaptaDark')
conflicts=('kvantum-qt4')
provides=('kvantum-qt4')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}

  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${_gitname}/${_gitname}
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_QT4=ON
	make
}

package() {
	cd ${srcdir}/${_gitname}/${_gitname}
	make DESTDIR=${pkgdir}/ install
#	install -Dm644 ChangeLog ${pkgdir}/usr/share/doc/kvantum/ChangeLog
#	install -Dm644 COPYING ${pkgdir}/usr/share/licenses/kvantum/COPYING
#	cp -r doc ${pkgdir}/usr/share/doc/kvantum
}