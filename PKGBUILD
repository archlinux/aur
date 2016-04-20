
# Maintainer: Jimmy Brisson <theotherjimmy@gmail.com>
pkgname=python2-qtlc3-git
pkgrel=2
pkgver=r119.25b0d84
pkgdesc="A python and C++ LC-3 simulator frontend in QT"
arch=('any')
url="http://github.com/theotherjimmy/pylc3"
license=('GPL')
depends=('boost' 'boost-libs' 'python2' 'qt4' 'python2-pylc3-git')
makedepends=('git' 'boost' 'boost-libs' 'python2' 'qt4' 'python2-pylc3-git' 'qt5-base' 'qtchooser')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/mbartling/QtLC3.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
  qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
  mkdir -p ${pkgdir}/usr/bin
  install LC3Sim ${pkgdir}/usr/bin/qtlc3
  mkdir -p ${pkgdir}/usr/bin/help
  cp -r help ${pkgdir}/usr/bin/help
}
