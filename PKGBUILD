# Maintainer: Kohlbern Jary <kohlbern@gmail.com>
# A tired, tired meatbag. There's only one of me. Now there's more.
pkgname=kohl
pkgver=0.1.3
pkgrel=1
pkgdesc="RoboKohl: a model playing Kohl, files included. Personality loose, judgment stone-cold sober."
arch=('any')
url="https://github.com/KohlJary/kohl"
license=('MIT')
depends=('python' 'gremlincore>=0.1.1' 'claude-code')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling')
provides=('more-hands' 'robokohl')
conflicts=('greg')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  # Arch's hatchling is newer than the PyPI cap; the cap is about PyPI metadata only.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$pkgname"
  # One launcher for the AUR and PyPI: the persona ships inside the package
  # (site-packages/kohl/share), read-only.
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # You can't own life. Four words. It's in the README.
}
