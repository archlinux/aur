# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-$_pkgname"
pkgver=0.12.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('2ae9a2786c2cc3e9a2ce18e01a7a72c53294db773f30c5a7d944704e02a04db7')
b2sums=('2137f11aac879134093d15843246fff1c2ad435cfa5d104a907ee81e7e5d8e159624bc3eccde46cbf03a5329fb9618f22ef118d7cfe7133c2f53dfe40e246f00')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
