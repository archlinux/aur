# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=1.1.3
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-installer' 'python-build' 'python-uv-build')
checkdepends=('ffmpeg' 'python-pytest' 'python-pytest-asyncio' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('cdbce109637f3e28b18897ea552cfa36f8e956f7f8ebe922c9fb162d78686a8baaf55ddfe27fdf394cae1fefd53ce5e2272b84e551741502e55bafad03b444a5')

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
