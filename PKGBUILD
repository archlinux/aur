# Maintainer: xanderboy2001 <alexanderechristian@gmail.com>

pkgname=python-nbtlib
pkgver=2.0.4
pkgrel=1
pkgdesc="A python library to read and edit nbt data"
arch=('any')
url="https://github.com/vberlier/nbtlib"
license=('MIT')
depends=(
		'python'
		'python-numpy'
)
makedepends=(
		'python-build'
		'python-installer'
		'python-poetry-core'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vberlier/nbtlib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eca23db8f63a3b5cf0d65a3eeaa2d516c5ceb4f44549ea8433b436c4c05e2a01')

prepare() {
		cd "$pkgname-$pkgver"
		sed -i \
				-e 's|requires = \["poetry>=0.12"\]|requires = ["poetry-core"]|' \
				-e 's|poetry.masonry.api|poetry.core.masonry.api|' \
				pyproject.toml
}

build() {
		cd "$pkgname-$pkgver"
		python -m build --wheel --no-isolation
}

package() {
		cd "$pkgname-$pkgver"
		python -m installer --destdir="$pkgir" dist/*.whl
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
