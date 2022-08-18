# This package is just4fun, do not take serious!
# Maintainer: SuperBart <superbart_chen@qq.com>
_pkgname="python-helang"
pkgname="${_pkgname}-git"
pkgver=r170.7888e33
pkgrel=1
pkgdesc="Wow, it's so cool! Science with delightment."
arch=("any")
url="https://www.github.com/kifuan/helang"
license=('MIT')
depends=("python" "python-tqdm" "pyside6")
makedepends=("git" "python-installer" "python-build" "python-wheel")
source=("git+$url")
conflicts=("${_pkgname}")
md5sums=("SKIP")

pkgver() {
  cd $srcdir/helang
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd $srcdir/helang
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/helang
	python -m installer --destdir="$pkgdir" dist/*.whl
}
