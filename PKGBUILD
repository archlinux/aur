# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=depix-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r55.3d6fc24
pkgrel=1
_pyver=3.9
pkgdesc="A tool for recovering passwords from pixelized screenshots"
arch=('any')
url="https://github.com/beurtschipper/Depix"
license=('CC-BY-4.0')
depends=('python')
makedepends=('git')
provides=("depix")
conflicts=("depix")
source=("${pkgname}::git+https://github.com/beurtschipper/Depix.git")
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
  cd "$srcdir/${pkgname}"
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
