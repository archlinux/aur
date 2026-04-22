# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgbase=python-netifaces-plus
pkgname='python-netifaces-plus'
_name=${pkgname#python-}
pkgver=0.12.5
pkgrel=1
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
sha512sums=('9811042f6f765a39d7f18a77686892c17d1f94bf128ec587f4ece7bac32573f6201712b7b7307947f30b4152b089e30d71e6d99bca3645b11b48399b696cee64')

build() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m build --wheel --no-isolation
}

package() {
  cd "netifaces-plus-release_${pkgver//\./_}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
