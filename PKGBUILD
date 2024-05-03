# Maintainer: robertfoster
_name=autoeq
pkgname="python-${_name}"
pkgver=4.1.2
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

sha256sums=('d4022a151749e6fe118ea919a0284f1d6cd0a9c1147c97c9122b2718ddd50e79'
            '0a4b2abe2ce8c631008eef038660e4c73e68739002cb3d458529c578891faa81')
