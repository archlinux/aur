# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=claude-tap-git
_pkgname=claude-tap
pkgver=0.1.124.r0.gb2aa47c
pkgrel=1
pkgdesc='Trace AI CLI API requests via local reverse and forward proxies'
arch=('any')
url='https://github.com/liaohch3/claude-tap'
license=('MIT')
depends=(
  'python'
  'python-aiohttp'
  'python-cryptography'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
