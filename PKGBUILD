# Contributor: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_gituser=pycontribs
_pkgname=jenkinsapi

pkgbase=python-${_pkgname}-git
pkgname=("python-${_pkgname}-git")
pkgver=0.3.11.r30.g4494278
pkgrel=1
pkgdesc="A Python API for accessing resources on a Jenkins continuous-integration server."
arch=('any')
url="https://github.com/${_gituser}/${_pkgname}"
license=('MIT')
makedepends=("python-build" "python-flit-core" "python-installer")
source=("${_pkgname}::git+https://github.com/pycontribs/jenkinsapi.git")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --no-isolation --wheel
}

package_python-jenkinsapi-git() {
  depends=("python" "python-requests" "python-pytz")
  conflicts=("python-${_pkgname}")

  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
