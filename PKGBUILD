# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=python38-distlib
_pkgname="${pkgname#python38-}"
pkgver=0.3.6
pkgrel=1
pkgdesc='Low-level functions that relate to packaging and distribution of Python 3.8 software'
arch=('any')
url='https://distlib.readthedocs.io'
license=('PSF')
depends=('python38')
makedepends=('python38-setuptools' 'python38-build' 'python38-installer' 'python38-wheel')
source=("https://github.com/pypa/distlib/releases/download/$pkgver/distlib-$pkgver.tar.gz"{,.asc})
b2sums=('9cd6cca18f2e2ed0c7644865644ccfa98387128ef4a4672a3fe457ee12f7625e8a01cbc8a12321262ae2e2a0c444d504bee11a2f608009d331e3a99b94206728'
        'SKIP')
validpgpkeys=('CA749061914EAC138E66EADB9147B477339A9B86') # Vinay Sajip <vinay_sajip@yahoo.co.uk>

prepare() {
  cd "$_pkgname-$pkgver"

  rm distlib/*.exe
}

build() {
  cd "$_pkgname-$pkgver"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  python3.8 tests/test_all.py
}

package() {
  cd "$_pkgname-$pkgver"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
}
