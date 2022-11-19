# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_name=pydantic
pkgname=python38-$_name
pkgver=1.10.2
pkgrel=1
pkgdesc='Data parsing and validation using Python type hints'
arch=(x86_64)
url="https://github.com/pydantic/pydantic"
license=(MIT)
depends=(python38-cython python38 python38-typing-extensions)
optdepends=(
  'python38-dotenv: for .env file support'
  'python38-email-validator: for email validation'
)
makedepends=(python38-build python38-installer python38-setuptools python38-wheel)
checkdepends=(python38-pytest python38-pytest-mock)
source=($_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('dc2acfb271cd62b6de08bbaa48dbc76ec8d3a3f3142778ffa2cb9a2a1cad62dbdb3c7470a50e9a2825837b65a48c6aefb8736411f32c398aa9ca779841b53ac5')
b2sums=('9aac69ace185ccc56255cf36f9af472caf4c6bcbdcbb81eec66353f755673e9a240e7713c0a2ecff00a02e07b0069e4b3f1edda41f345698a979b79dd54b354a')

build() {
  cd $_name-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
