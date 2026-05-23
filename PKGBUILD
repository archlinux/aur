# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=greprip
pkgname=$_pkgname-git
pkgver=r11.70908b1
pkgrel=1
epoch=1
pkgdesc="Transparent grep/find to rg/fd translators for LLM coding agents"
arch=('any')
url="https://github.com/kaofelix/$_pkgname"
license=('MIT')
depends=(
  'python>=3.12'
  'ripgrep'
  'fd'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/kaofelix/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
