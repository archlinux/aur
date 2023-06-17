# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-tiktoken
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="A fast BPE tokeniser for use with OpenAI's models"
arch=(x86_64)
url="https://github.com/openai/tiktoken"
license=(MIT)
depends=(
  python-regex
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-rust
  python-wheel
)
# checkdepends=(
#   python-pytest
# )
optdepends=(
  'python-blobfile: for reading blobfiles'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5a4c3ddc6c86a8ce26800262ad521053012e195e286ad21927eeeca6fa4a9c62')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_archive"

#   python -m pytest
# }

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
