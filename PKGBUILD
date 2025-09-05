# Maintainer: teraflops <me@priet.usº>

pkgname=python-mopidy-tidal-git
_pkgname=mopidy-tidal
pkgver=0.3.11.r0.ge27a79d
pkgrel=1
pkgdesc="TIDAL music service integration for Mopidy"
arch=('any')
url="https://github.com/tehkillerbee/mopidy-tidal"
license=('Apache')
depends=('python' 'python-tidalapi' 'python-pykka' 'python-requests' 'mopidy')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('mopidy-tidal')
conflicts=('mopidy-tidal')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long 2>/dev/null \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  : 
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

