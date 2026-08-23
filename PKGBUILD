# Maintainer: Vantage Contributors <dev@vantage.local>
_pkgname=vantage
pkgname=vantage-git
pkgver=r0.g0
pkgrel=1
pkgdesc="Offline-first command center for your codebase: knowledge graphs, git intelligence, security & quality scans, optional local AI"
arch=('any')
url="https://github.com/androvonx95/vantage"
license=('MIT')
depends=('python' 'python-rich')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('vantage')
conflicts=('vantage')
source=("git+https://github.com/androvonx95/vantage.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
