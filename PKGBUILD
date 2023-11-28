# Maintainer: robertfoster
_name=autoeq
pkgname="python-${_name}"
pkgver=4.1.1
pkgrel=1
pkgdesc="Automatic headphone equalizer config generator"
arch=(any)
url="https://github.com/jaakkopasanen/AutoEq"
license=("MIT")
depends=(
  'python-matplotlib'
  'python-numpy'
  'python-pillow'
  'python-pyyaml'
  'python-scipy'
  'python-soundfile'
  'python-tabulate'
  'python-tqdm'
)
makedepends=(python-build python-hatchling python-installer python-setuptools python-wheel)

source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  "$_name.sh"
)

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 "../$_name.sh" "$pkgdir/usr/bin/$_name"
}

sha256sums=('7860a1f92d9fdda6677b9b6e9bfca21deca7f0bab37f85bb7c6f4e1462f73b99'
  '0a4b2abe2ce8c631008eef038660e4c73e68739002cb3d458529c578891faa81')
