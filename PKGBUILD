# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-amodem
pkgver=1.12
pkgrel=1
pkgdesc="Audio Modem Communication Library"
arch=('any')
depends=('python2' 'python2-argcomplete' 'python2-numpy' 'python2-six')
makedepends=('python2-setuptools')
url="https://github.com/romanz/amodem"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/a/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('437c3d6eca991e8f7104c30fcba75476')
sha256sums=('a6d9b4a8a42e6f5f42fd7df0d9994a1fb89356cd1d67881d671f488c7557cc45')

prepare() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
