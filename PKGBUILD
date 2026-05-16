# Maintainer: Michael Serajnik <m at mser dot at>
pkgname=10ff-git
_pkgname=10ff
pkgver=r56.9be5cf0
pkgrel=1
pkgdesc="Typing tests in CLI"
arch=("any")
url="https://github.com/rr-/${_pkgname}"
license=("WTFPL")
depends=("python")
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
source=("git+https://github.com/rr-/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
