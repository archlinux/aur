# Contributor: Mia Teufel <mteufel@urandom.eu.org>
_base=ircmatch
pkgname=python-${_base}-git
pkgver=ircmatch.1.1.r7.g0083a41
pkgrel=1
pkgdesc="python extension for fast IRC mask matching and collapsing"
arch=(i686 x86_64)
url="https://github.com/mammon-ircd/${_base}"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel git)
options=(!emptydirs)
source=(git+${url}.git)
md5sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
