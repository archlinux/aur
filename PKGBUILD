# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.7.8
pkgrel=5
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ffmpeg' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('0ffae9db1567e749b03face8d3b039b521e1273bc22128fa710fd94fc06bec30442b338d2dc2621d74354c81e7f79f77930e729b3178ece76e25c77fa9b6e637')

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
