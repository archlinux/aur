# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=python2-libfiu
_pkgname=libfiu
pkgver=0.93
pkgrel=1
pkgdesc="userspace fault injection framework"
arch=('i686' 'x86_64')
url="https://blitiri.com.ar/p/libfiu/"
license=('custom')
depends=('libfiu' 'python2')
makedepends=('make' 'gcc')
source=("https://blitiri.com.ar/p/$_pkgname/files/$pkgver/$_pkgname-$pkgver.tar.gz")
md5sums=('8d8126a05a0fd7e833544c6a73deb256')

build() {
  cd $srcdir/$_pkgname-$pkgver/bindings/python
  python2 setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver/bindings/python
  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install LICENSE
  cd $srcdir/$_pkgname-$pkgver
  install -D -m664 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
