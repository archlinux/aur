# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-netifaces-plus
pkgname='python-netifaces-plus'
_name=${pkgname#python-}
pkgver=0.12.4
pkgrel=2
pkgdesc='Fork of al45tair/netifaces, portable module to access network interface information.'
arch=('any')
url='https://pypi.org/project/netifaces-plus/'
license=('MIT')
depends=('python')
provides=('python-netifaces')
conflicts=('python-netifaces')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

source=("python-netifaces-plus-${pkgver}-${pkgrel}.tar.gz::https://github.com/tsukumijima/netifaces-plus/archive/refs/tags/release_${pkgver//\./_}.tar.gz")
sha512sums=('65fdf5319e7a8073df17b5047d113cda27f82ae3fdbd0deb2af0578591f1c87ff0afdcda96c691951cdc7ec4370370d46895294d078c34296fd17cba2a664350')

build() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m build --wheel --no-isolation
}

package() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
