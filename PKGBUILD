# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

_name="pidng"
_NAME='PiDNG'
pkgname=python-${_name}-git
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=3.4.4+16+g30bee22
pkgrel=1
pkgdesc="Create Adobe DNG RAW files using Python."
url="https://github.com/schoolpost/${_name}"
license=('unknown')  # https://github.com/schoolpost/PiDNG/issues/33
arch=('x86_64')
depends=('python-exifread' 'python-numpy')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git describe --tags | sed 's/-/+/g;s/v//;'
}

build() {
  cd ${srcdir}/${_name}
  python setup.py build
}

package() {
  cd ${srcdir}/${_name}
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

