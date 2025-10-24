# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=terminaltexteffects-git
pkgver=0.12.1.r9.g1613a8c
pkgrel=1
pkgdesc='Visual effects engine applied to text in the terminal. '
url="https://github.com/ChrisBuilds/terminaltexteffects"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling')
provides=('terminaltexteffects' 'python-terminaltexteffects' 'python-terminaltexteffects-git')
conflicts=('terminaltexteffects' 'python-terminaltexteffects')
source=("$pkgname"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --abbrev=7 | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
