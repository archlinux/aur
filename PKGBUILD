# Maintainer: ole <ole at orhagen.no>
pkgname=python-terminaltexteffects-git
_name=terminaltexteffects
pkgver=d9a1ecea9ceadad4921662569220d8db042b7f96
pkgrel=1
pkgdesc="TerminalTextEffects (TTE) is a terminal visual effects engine."
arch=('any')
url="https://github.com/ChrisBuilds/terminaltexteffects"
license=('MIT')
provides=("python-terminaltexteffects")
conflicts=("python-terminaltexteffects")
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("git+https://github.com/ChrisBuilds/terminaltexteffects.git")
sha256sums=('SKIP')

pkgver() {
	  cd "$srcdir/${_name}"
	  printf "%s" "$(git rev-parse HEAD)"
}

build() {
  cd "${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
