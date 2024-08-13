# Maintainer: Seeky <seeky.mkw@gmail.com>
pkgname=python-pyelf2rel
pkgver=1.0.1
pkgrel=1
pkgdesc="Python tools for creating Nintendo REL files"
arch=(any)
url="https://github.com/SeekyCt/pyelf2rel"
license=('MIT')
depends=(python-pyelftools)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-vcs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('e00e930c38d43e3316858e6067520cb38769f03cc5f2099edb1b633e4e2426d0')
SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE
}
