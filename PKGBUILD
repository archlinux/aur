# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_src=resolve-march-native
pkgname=python-resolve_march_native-git
pkgver=r779.0680f8786ca6b79e45851806837a64147a4cced3
pkgrel=1
pkgdesc="Small cli to resolve -march=native into explicit GCC or Clang flags"
arch=('any')
url='https://github.com/hartwork/resolve-march-native'
license=('GPL-2.0-or-later')
depends=('python' 'python-coverage' 'python-exceptiongroup' 'python-iniconfig' 'python-pygments' 'python-tomli' 'python-typing_extensions')
makedepends=(
    'python-build'
    'python-installer'
    'python-packaging'
    'python-setuptools'
    'python-wheel'
)
provides=("${pkgname%-git}")
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd $_src
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

build() {
  cd $_src
  python -m build --wheel --no-isolation
}

package() {
  cd $_src
  python -m installer --destdir="$pkgdir" dist/*.whl
}
