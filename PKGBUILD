# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Matteo Triggiani <davvore33@gmail.com>

pkgname=python-pickledb
pkgver=1.6
pkgrel=2
pkgdesc='A Lightweight, simple and fast Python key-value store with asynchronous support'
url="https://patx.github.io/pickledb/"
arch=('any')
license=('BSD-3-Clause')
depends=(
  'python'
  'python-aiofiles'
  'python-orjson'
)
makedepends=(
  'git'
  'python-build'
  'python-flit-core'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-aiosqlite'
  'python-pytest'
  'python-pytest-asyncio'
)
optdepends=("python-aiosqlite: Alternative backend to orjson")
source=("git+https://github.com/patx/pickledb.git#tag=v$pkgver")
sha256sums=('35404eb52818f11e601573d6562678612a912a11f608423c392d80a7804dcc3d')

build() {
    cd "pickledb"
    python -m build --wheel --no-isolation
}

check() {
    cd "pickledb"
    pytest -v
}

package() {
    cd "pickledb"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
