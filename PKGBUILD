
# Maintainer: Jimmy Brisson <theotherjimmy@gmail.com>
pkgname=python2-pylc3-git
pkgrel=2
pkgver=r160.1a4ff2d
pkgdesc="A python and C++ LC-3 simulator"
arch=('any')
url="http://github.com/theotherjimmy/pylc3"
license=('GPL')
depends=('boost' 'boost-libs' 'python2')
makedepends=('git' 'boost' 'boost-libs' 'python2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/theotherjimmy/pylc3.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
	make
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
	make -k test
}

package() {
	cd "$srcdir/${pkgname%-VCS}"
  make install DESTDIR=${pkgdir}
  mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages
  mv ${pkgdir}/usr/lib/python2.7/dist-packages/pylc3.so ${pkgdir}/usr/lib/python2.7/site-packages/pylc3.so
  rm ${pkgdir}/usr/lib/libpylc3.so
  ln -s /usr/lib/python2.7/site-packages/pylc3.so ${pkgdir}/usr/lib/libpylc3.so
}
