# Maintainer: Sombrechip88244 <Sombrechip88244@users.noreply.github.com>
pkgname=tui-games-launcher-git
pkgver=1.0.0.r0.gff4c8ad
pkgrel=1
pkgdesc="A minimal, classic, keyboard-driven game launcher for Steam and more."
arch=('any')
url="https://github.com/Sombrechip88244/tui-games-launcher"
license=('MIT')
depends=('python' 'python-textual' 'python-tomli-w')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
