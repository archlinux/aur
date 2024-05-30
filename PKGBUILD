# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=terminaltexteffects-git
pkgver=r1076.da16985
pkgrel=1
pkgdesc='Visual effects engine applied to text in the terminal. '
url="https://github.com/ChrisBuilds/terminaltexteffects"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-poetry-core')
provides=('terminaltexteffects')
conflicts=('terminaltexteffects')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare(){
  cd $pkgname
  git clean -dfx
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=2 sw=2 et:
