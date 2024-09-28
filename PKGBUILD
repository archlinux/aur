# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.9.1
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ffmpeg' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('d2decd38454e0849f5efee0117c70bf34a5d1ec5f97bfd9d9a7fe7a46400c7f42d563e656504c09c3725710ba92e954684cffa4008618e6702c215971c8ee0a3')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_name}-${pkgver}
  pytest test/test.py
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
