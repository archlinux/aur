# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-base64io
_name=${pkgname#python-}
pkgver=1.0.3
pkgrel=1
pkgdesc="A stream implementation for Python that provides transparent base64 encoding and decoding of an underlying stream."
arch=('any')
url="https://github.com/aws/base64io-python"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('24f2d0fe765c35339e1b2d33aa95f9137b1b765b594164fad1016c15827a7073')

prepare() {
  cd "$_name-$pkgver"
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  rm -f "$pkgdir/"usr/{*.rst,LICENSE}
}
