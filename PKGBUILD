# Maintainer:
# Contributor: memchr

_pkgname="piper-tts"
pkgname="$_pkgname-git"
pkgver=1.4.0.r0.g490b4df
pkgrel=1
epoch=1
pkgdesc="A fast, local neural text to speech system"
url="https://github.com/OHF-Voice/piper1-gpl"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'python'
  'python-onnxruntime'
  'python-pathvalidate' # AUR
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-scikit-build'
  'python-wheel'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
