# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('ffmpeg' 'python-tqdm')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('ffmpeg' 'python-pytest' 'python-pytest-asyncio' 'procps-ng')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('298877dc61f8b82c1bb9162fe2f515bdabc57ced9181288bd77d1b244da619dc5c53dc7e819c5b4b51e7d5ddd59ba4d614d55c184d9b80fe7e453e1fdf6f1144')

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
