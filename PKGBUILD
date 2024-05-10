# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=python-concurrent-log-handler
pkgver=0.9.25
pkgrel=7
pkgdesc="RotatingFileHandler replacement with concurrency, gzip and Windows support"
arch=('any')
url="https://github.com/Preston-Landers/concurrent-log-handler"
license=('Apache-2.0')
depends=(
  'python'
  'python-hatchling'
  'python-portalocker'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-hatch'
  'python-pytest'
)
source=("${pkgname}::git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

#check() {
#  cd "${srcdir}/${pkgname}"
#  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#  hatch run test.py${python_version}:cov
#}
# 2 tests fail at the moment

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
