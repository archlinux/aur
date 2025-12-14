# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-base64io
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=2
pkgdesc="A stream implementation for Python that provides transparent base64 encoding and decoding of an underlying stream."
arch=('any')
url="https://github.com/aws/base64io-python"
license=('Apache-2.0')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f72e0cc0236f499d91e12b9cdb45768e8e1c9a71d228bf17d729475b70580700')

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  rm -f "$pkgdir/"usr/{*.rst,LICENSE}
}
