# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-$_pkgname"
pkgver=0.16.1
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('379f0233cdf8cf157588c77bb2ab1ac367431d9bf6e8456a336b026d528cee0d')
b2sums=('e2451809a2ebe9baeef80fac7ee49708424da7229cdfab8be656c80ddb67280139ab57a730678494aaa33961bf227aa47020a8b1461e0a8c279cbfe49033c1c1')

build() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname//-/_}-${pkgver}"

  PYTHONPATH="src" pytest
}

package() {
  cd "${_pkgname//-/_}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
