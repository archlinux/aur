# Maintainer: Kam1k4dze <me@kam1k4dze.com>
pkgname=inspect-deps
pkgver=0.1.2
pkgrel=1
pkgdesc="ELF dependency analyzer for Arch Linux"
arch=('any')
url="https://github.com/Kam1k4dze/inspect-deps"
license=('MIT')
depends=('python' 'binutils' 'pacman')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf80692bb7b3d115c8e661766d8f570b6edbcfb596ac433512d486a2a3515462')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 completions/inspect-deps.bash "$pkgdir/usr/share/bash-completion/completions/inspect-deps"
  install -Dm644 completions/_inspect-deps "$pkgdir/usr/share/zsh/site-functions/_inspect-deps"
  install -Dm644 completions/inspect-deps.fish "$pkgdir/usr/share/fish/vendor_completions.d/inspect-deps.fish"
}

