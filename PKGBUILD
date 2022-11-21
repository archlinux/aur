# Maintainer: David Runge <dvzrv@archlinux.org>

_name=setuptools-scm-git-archive
pkgname=python38-setuptools-scm-git-archive
pkgver=1.4
pkgrel=1
pkgdesc="setuptools_scm plugin for git archives"
arch=(any)
url="https://github.com/changaco/setuptools_scm_git_archive/"
license=(MIT)
depends=(python38-setuptools-scm)
makedepends=(python38-build python38-installer python38-wheel)
checkdepends=(python38-pytest)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha512sums=('dee1a088cf7cc8c829bd6b197ab751135b65fdfbab40460cec5d360b50f84ccd64c28271312a8f387ac91111d688eebcf3626edeb3afdc7a8c7604a10647df93')
b2sums=('4258fbf3a7644e7a30ec3cb46ffe7b70ec465d35b5d2ce743e536f72e7bc89104934e2b161a4210a15724f498219906483d255aa1381701428da0f2e1f30dae4')

build() {
  cd ${_name//-/_}-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ${_name//-/_}-$pkgver
  pytest -v tests.py
}

package() {
  cd ${_name//-/_}-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
