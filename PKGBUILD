# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-jackclient
_name=${pkgname#python-}
pkgver=0.5.5
pkgrel=1
pkgdesc="JACK Audio Connection Kit (JACK) Client for Python"
arch=('any')
url="https://jackclient-python.readthedocs.io"
license=('GPL-3.0-or-later')
depends=('python-cffi')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
#checkdepends=(
#  'jack2'
#  'python-pytest'
#)
optdepends=('python-numpy: Get audio buffer as NumPy array')
source=("https://github.com/spatialaudio/jackclient-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a3158b215eb0e20d67543b4000f40424b5754d3e5d63fc7f6a036055e8fd753d')

build() {
  cd "$_name-python-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-python-$pkgver"

  # Start jackd with "dummy" backend
#  jackd --no-realtime -d dummy &

#  python -m venv --clear --without-pip --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest
#}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
