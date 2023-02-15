# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=soundfile
pkgname=python-soundfile
pkgver=0.12.0
pkgrel=1
pkgdesc='A Python library to read and write audio files using libsndfile, CFFI and NumPy'
url='https://github.com/bastibe/python-soundfile'
arch=(any)
license=(BSD)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-cffi libsndfile python-numpy)
checkdepends=(python-pytest)
source=("https://github.com/bastibe/python-soundfile/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('e50c42733ff5396e49a6a689722fa362387b2c403273bcc195994bf4a8e2df3f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python setup.py test
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
