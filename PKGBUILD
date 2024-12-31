# Maintainer: Seeky <seeky.mkw@gmail.com>
pkgname=python-pyelf2rel
pkgver=1.0.5
pkgrel=1
pkgdesc="Python tools for creating Nintendo REL files"
arch=(any)
url="https://github.com/SeekyCt/pyelf2rel"
license=('MIT')
depends=(python-pyelftools)
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-vcs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('a438264517a704eae84e2508847889a689189c3cb1d70bdaebbb6f7b05ca35e1')
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
