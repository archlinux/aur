# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>
pkgname=cython2
_name="${pkgname%2}"
pkgver=0.29.33
pkgrel=1
pkgdesc='C-Extensions for Python 2'
arch=('x86_64')
url='https://cython.org'
_github='https://github.com/cython/cython'
license=('APACHE')
makedepends=('python2-setuptools')
depends=('python2')
source=("$pkgname-$pkgver.tar.gz::$_github/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f1c07848de6c1bbe995c2bdbe237e558fd08747568b9503b079aae661fb8d99f')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Update shebangs in scripts to call "python2" instead of "python"
  find -name "*.py*" -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  find "$pkgdir/usr/bin" -type f -not -name '*2' -exec mv '{}'{,2} \;
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
