# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=1.1.2
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-installer' 'python-build' 'python-uv-build')
checkdepends=('ffmpeg' 'python-pytest' 'python-pytest-asyncio' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('b91c6b6e59936662c1fec163349f394b53732c4ddf692ebf7d8bb0a06d51af17420167ed4d64d18513afef7674da4c557cd1d15d346c151712a02f2cb6863d49')

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
