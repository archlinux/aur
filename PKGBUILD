# Maintainer: prg <prg-archlinux@xannode.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>

pkgname=python2-pycurl
pkgver=7.44.1
pkgrel=5
pkgdesc="A Python 2.x interface to libcurl"
arch=('x86_64')
url="http://pycurl.sourceforge.net/"
license=('LGPL' 'MIT')
depends=('python' 'curl')
makedepends=('python2-setuptools')
source=("https://github.com/pycurl/pycurl/archive/REL_${pkgver//./_}/$pkgname-$pkgver.tar.gz")
sha512sums=('bb92a5a7417bcd88be3b638b88f97164303bdbb7271d3b8527ca8da5b546ee13bf639f36b48d5cd204c83101712256ab218004e081b79bc5415a873bf9e611a4')

prepare() {
  mv pycurl-REL_${pkgver//./_} pycurl-$pkgver
}

build() {
  cd pycurl-$pkgver
  make
  python2 setup.py build
}

package() {
  cd pycurl-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"
  install -Dm644 COPYING-MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -rf $pkgdir/usr/share/doc
}
