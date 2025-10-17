# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=rnsh
pkgver=0.1.7
pkgrel=1
pkgdesc="Shell over Reticulum"
arch=('any')
depends=('python' 'python-rns' 'python-docopt' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
url="https://github.com/acehoss/rnsh"
license=('MIT')
source=($pkgname-$pkgver::$url/archive/refs/tags/release/v$pkgver.tar.gz)
sha256sums=('555f0c3a1a5fa6be93de664deec290f278e39c0ec5d087921ecdeb72cff11e2e')

build() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-release-v$pkgver"

  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
