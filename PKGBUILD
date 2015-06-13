# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=since
pkgver=1.1
pkgrel=1
pkgdesc="A stateful tail command"
arch=('i686' 'x86_64')
url="http://welz.org.za/projects/since"
license=('GPL')

depends=(glibc)
makedepends=(gcc)
source=(http://welz.org.za/projects/since/since-${pkgver}.tar.gz)
md5sums=('7a6cfe573d0d2ec7b6f53fe9432a486b')
sha256sums=('739b7f161f8a045c1dff184e0fc319417c5e2deb3c7339d323d4065f7a3d0f45')

build() {
  cd since-${pkgver}
  make
}

package() {
  cd since-${pkgver}

  # workaround: prefix is hard-coded in the Makefile
  sed --in-place "s_prefix=/usr/local__" Makefile
  make prefix="$pkgdir/usr" install
}
