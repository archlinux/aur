# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=soundfile
pkgname=python-soundfile
pkgver=0.12.1
pkgrel=1
pkgdesc='A Python library to read and write audio files using libsndfile, CFFI and NumPy'
url='https://github.com/bastibe/python-soundfile'
arch=(any)
license=(BSD)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-cffi libsndfile python-numpy)
checkdepends=(python-pytest)
source=("https://github.com/bastibe/python-soundfile/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('e8e1017b2cf1dda767aef19d2fd9ee5ebe07e050d430f77a0a7c66ba08b8cdae')

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
