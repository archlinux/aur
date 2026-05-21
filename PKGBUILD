# Maintainer: nihf <nihf at example dot com>

_pkgname=waltuhfetch
pkgname=waltuhfetch
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc="A neofetch clone featuring Walter White and BreakingLinux"
arch=('any')
url="https://github.com/nihf/WaltuhFetch"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
