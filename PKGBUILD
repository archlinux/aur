# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: James An <james@jamesan.ca>

pkgname=python-bencodepy
_name=bencode.py
pkgver=4.0.0
pkgrel=1
pkgdesc='A small Python 3 library for encoding and decoding Bencode data'
arch=('any')
url="https://github.com/eweast/$_pkgname"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
  'small_fixes.patch'
)
sha256sums=('2a24ccda1725a51a650893d0b63260138359eaa299bb6e7a09961350a2a6e05c'
            '09673b21c54864ad746e8af7f729d2a314a4665e78be9aa4f21f078d33b3e465')

prepare() {
  patch -d "$_name-$pkgver" -N -i ../small_fixes.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
