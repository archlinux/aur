# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributors: crocowhile

_name="pidng"
_NAME='PiDNG'
pkgname=python-${_name}-git
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=20250603.8427835
pkgrel=1
pkgdesc="Create Adobe DNG RAW files using Python."
url="https://github.com/schoolpost/${_name}"
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('python-exifread' 'python-numpy')
makedepends=('python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_name}
  git log -1 --format=%cd.%h --date=short|tr -d -
}

build() {
  cd ${srcdir}/${_name}
  python setup.py build
}

package() {
  cd ${srcdir}/${_name}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

