# Maintainer: robertfoster

pkgname=python-dmidecode
pkgver=3.12.3 # renovate: datasource=github-tags depName=nima/python-dmidecode
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/nima/python-dmidecode"
pkgdesc="Python module to access DMI data"
license=('GPL2')
depends=('python' 'dmidecode' 'libxml2' 'python-lxml')
makedepends=('python' 'python-setuptools' 'libxml2')
source=("${url}/archive/v$pkgver.tar.gz"
  makefile.patch)

prepare() {
  cd $srcdir/$pkgbase-${pkgver}
  patch -Np1 -i ../makefile.patch
}

build() {
  cd $srcdir/$pkgbase-${pkgver}
  export CFLAGS+=" -std=gnu89"
  make build
}

package() {
  cd $srcdir/$pkgbase-${pkgver}
  python src/setup.py install --root=$pkgdir
}

sha256sums=('44d45d7d8344290c259c989d3af3f614c7837cbd85052d486adfa46a1c777164'
  '46413b661e5394b65a4be50bd46102aaa4214e3d6e993613f53e58e98e2f602c')
