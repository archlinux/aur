# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=result
pkgname="python-$_pkgname"
pkgver=0.17.0
pkgrel=1
pkgdesc="A rust-like result type for Python"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('b73da420c0cb1a3bf741dbd41ff96dedafaad6a1b3ef437a9e33e380bb0d91cf')
b2sums=('5f8423c2ba368f3a4074a7c8841fc2368f60e4a0af88a19714adf8e59a27682372d5e7afa829e2a08e03487ee5cf5450375bee7b0036a578497eab526c62a4ee')

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
