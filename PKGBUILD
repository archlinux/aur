# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ekin Dursun <ekindursun@gmail.com>

pkgname=python-mpv
pkgver=1.0.2
pkgrel=1
pkgdesc='Python interface to the awesome mpv media player'
arch=('any')
url=https://github.com/jaseg/python-mpv
_url_pypi=https://pypi.org/project/python-mpv
license=('GPL' 'LGPL')
depends=('mpv' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-xvfbwrapper')
optdepends=('python-pillow: for raw screenshot support')
source=("https://github.com/jaseg/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('1a364761405e430ed91f597e15aae7f6c221980c2ed9ce0152109486d1fb79ebb7b6257c79bfef34d72468bcf335e8e514324bdd10982096a64f8949b4bca261')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 'README.rst' -t "$pkgdir"/usr/share/doc/$pkgname
}
