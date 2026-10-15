# Maintainer: Ivo Maceira <ivomaceira at gmail dot com>
pkgname=python-deepgram-sdk
pkgver=7.13.0  # https://pypi.org/project/deepgram-sdk/
pkgrel=1
pkgdesc="Official Deepgram SDK for Python"
arch=("any")
url="https://github.com/deepgram/deepgram-python-sdk"
license=("MIT")
depends=(
  "python"
  "python-httpx"
  "python-pydantic"
  "python-pydantic-core"
  "python-typing_extensions"
  "python-websockets"
)
optdepends=()
makedepends=("python-build" "python-installer" "python-poetry-core")
source=("$pkgname-$pkgver.tar.gz::https://github.com/deepgram/deepgram-python-sdk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("be7f1d09dbf990a51a94b111d6e51752c7e547e0c64f6e41eb572a223c10a637")

build() {
	cd "deepgram-python-sdk-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "deepgram-python-sdk-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
