# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=1.0.5
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-installer' 'python-build' 'python-uv-build')
checkdepends=('ffmpeg' 'python-pytest' 'python-pytest-asyncio' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('d03dc3687839ae2111c0707b1853f8c2f93b8b9b1b93ddc637b8591822ef4e01363fe0d22170a07ccefee5f6ddfc1a7a0dded33a39841da377b96be79feed4f9')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd ${_name}-${pkgver}
  python -m venv --system-site-packages venv
  venv/bin/python -m installer dist/*.whl
  PATH="venv/bin:$PATH" venv/bin/python -m pytest tests
}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
