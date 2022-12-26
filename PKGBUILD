# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=codespell-git
pkgver=2.2.2.r160.g36c8c276
pkgrel=1
pkgdesc="Tool for fixing common misspellings in text files"
arch=('any')
url="https://github.com/codespell-project/codespell"
license=('GPL2')
depends=('python')
makedepends=('git' 'help2man' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
provides=("codespell=$pkgver")
conflicts=('codespell')
source=("git+https://github.com/codespell-project/codespell.git")
sha256sums=('SKIP')


pkgver() {
  cd "codespell"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "codespell"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "codespell"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}
