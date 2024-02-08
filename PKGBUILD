# Maintainer: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>
pkgname=python-atlassian-api
_name=atlassian-python-api
pkgver=3.41.9
pkgrel=1
pkgdesc="Python Atlassian REST API Wrapper"
arch=(any)
url="https://github.com/atlassian-api/atlassian-python-api"
license=('Apache')
depends=(
  python
  python-deprecated
  python-oauthlib
  python-requests
  python-requests-oauthlib
  python-six
  python-jmespath
  python-beautifulsoup4
)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
optdepends=('python-requests-kerberos: Kerberos authentication'
            'python-lxml: XML support')
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('81378f672a0b2d713e03837e5fee0d83fc83c32c4f870ecdfc5919e072433c0f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}
