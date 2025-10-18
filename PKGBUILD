# Maintainer: teraflops <me@priet.usº>
# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>

pkgbase=python-tidalapi-git
pkgname=('python-tidalapi-git')
pkgver=0.8.8.r0.g29d5153
pkgrel=1
pkgdesc="Unofficial Python API for TIDAL music streaming service"
arch=('any')
url="https://github.com/EbbLabs/python-tidal"
license=('LGPL3')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("git+https://github.com/EbbLabs/python-tidal.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/python-tidal"
  # genera una versión basada en los commits
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./g' || \
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/python-tidal"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/python-tidal"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

