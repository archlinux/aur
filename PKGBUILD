# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname=python-mpv
pkgver=1.0.3
pkgrel=1
pkgdesc='Python interface to the awesome mpv media player'
arch=('any')
url=https://github.com/jaseg/python-mpv
_url_pypi=https://pypi.org/project/python-mpv
license=('GPL' 'LGPL')
depends=('mpv' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
checkdepends=('python-pytest' 'python-xvfbwrapper')
optdepends=('python-pillow: for raw screenshot support')
source=("https://github.com/jaseg/$pkgname/archive/vv$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('8438babe099f0a40903dd09e0bd2ce846168641d30e49e8bc87bb66b73952b4fb6d23e8dfd915c249074330a3f50f10218e0c59e63e9dc9c01f44b8907729dd2')

build() {
  cd $pkgname-vv$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-vv$pkgver
  pytest
}

package() {
  cd $pkgname-vv$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 'README.rst' -t "$pkgdir"/usr/share/doc/$pkgname
}
