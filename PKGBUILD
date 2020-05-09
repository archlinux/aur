# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgbase=python-parallax
pkgname=('python-parallax' 'python2-parallax')
pkgver=1.0.6
pkgrel=1
pkgdesc="Execute commands and copy files over SSH to multiple machines at once"
arch=('any')
license=('BSD')
url="https://github.com/krig/parallax"
makedepends=('python-setuptools' 'python2-setuptools')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('229175f4347d2bd13a10b6f871f9ea35e724ad7a730d2e613d08948bc18b1533')

prepare() {
  cd "$srcdir"
  cp -a parallax-$pkgver python-parallax-$pkgver
  cp -a parallax-$pkgver python2-parallax-$pkgver
}

build() {
  cd "$srcdir"/python-parallax-$pkgver
  python setup.py build

  cd "$srcdir"/python2-parallax-$pkgver
  python2 setup.py build
}

package_python-parallax() {
  depends=('python')
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
package_python2-parallax() {
  depends=('python2')
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "$pkgdir/usr/bin/parallax-askpass" "$pkgdir/usr/bin/parallax-askpass2"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: set sw=2 et:
