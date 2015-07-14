# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>

_name=owncloudclient
pkgname=owncloud-client-qt5
pkgver=1.8.4
pkgrel=1
pkgdesc='ownCloud client based on mirall built with Qt 5'
arch=(i686 x86_64)
url='http://owncloud.org/'
license=(GPL2)
depends=(qtkeychain-qt5 qt5-tools)
makedepends=(cmake python-sphinx)
optdepends=('python2-nautilus: integration with Nautilus'
	    'nemo-python: integration with Nemo')
conflicts=('owncloud-client')
install=$pkgname.install
backup=('etc/ownCloud/sync-exclude.lst')
source=("https://download.owncloud.com/desktop/stable/$_name-$pkgver.tar.xz")
md5sums=('ce82c234fca674062599b3ceb4ac50c6')

prepare() {
  cd $srcdir/$_name-$pkgver
  mkdir -p build

}

build() {
  cd $srcdir/$_name-$pkgver/build

  cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc/$pkgname \
        
  make
  make doc-man
}

package() {
  cd $srcdir/$_name-$pkgver/build
  make DESTDIR="$pkgdir" install
}
