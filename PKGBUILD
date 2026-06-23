# Maintainer: Shimi Chen <shimi dot chen at gmail dot com>

pkgname=python-pykrx
_pkgname=pykrx
pkgver=1.2.8
pkgrel=1
pkgdesc="KRX (Korea Exchange) stock and bond data scraping library"
arch=('any')
url="https://github.com/sharebook-kr/pykrx"
license=('MIT')
depends=(
  'python'
  'python-requests'
  'python-pandas'
  'python-numpy'
  'python-deprecated'
  'python-multipledispatch'
  'python-matplotlib'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b2da03e62047db0ca7eefbcdf5bc2489857fa25a6faf1c2ddbb070b10fab0246')

build() {
  cd "$_pkgname-$pkgver"
  # setuptools_scm reads the version from the PKG-INFO shipped in the sdist.
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Upstream declares the MIT license in its metadata but ships no LICENSE
  # file in the release tarball or repository, so there is none to install.
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
