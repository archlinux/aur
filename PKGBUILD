# Maintainer: Kam1k4dze <me@kam1k4dze.com>
pkgname=inspect-deps
pkgver=0.1.1
pkgrel=1
pkgdesc="ELF dependency analyzer for Arch Linux"
arch=('any')
url="https://github.com/Kam1k4dze/inspect-deps"
license=('MIT')
depends=('python' 'binutils' 'pacman')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6578b10a334a60a97a3d4223782105cf2340dc82df7c8a70199b43f3b7bb6c7a')

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

