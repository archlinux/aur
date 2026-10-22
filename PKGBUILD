# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: Amir Shygun <a-shygun@users.noreply.github.com>
pkgname=terrascope-git
pkgver=0.3.0.r0.ga904987
pkgrel=1
pkgdesc="Braille-rendered terminal world map with live weather and aircraft (git)"
arch=('any')
url="https://github.com/a-shygun/terrascope"
license=('MIT')
depends=('python>=3.10' 'python-numpy' 'python-pillow' 'python-yaml' 'python-pyshp')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('terrascope')
conflicts=('terrascope')
source=("$pkgname::git+https://github.com/a-shygun/Terrascope.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
