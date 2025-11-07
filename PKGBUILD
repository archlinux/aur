pkgname=smartplayctl-git
pkgver=62e0b4a
pkgrel=1
pkgdesc="Smart wrapper around playerctl that automatically selects the right media player (for PipeWire, MPRIS, Hyprland)"
arch=('any')
url="https://github.com/larsstifi/smartplayctl"
license=('MIT')
depends=('playerctl' 'python')
makedepends=('git')
provides=('smartplayctl')
conflicts=('smartplayctl')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/smartplayctl"
  # Generate a version string based on the latest git tag or commit
  git describe --tags --always 2>/dev/null | sed 's/^v//;s/-/./g'
}

package() {
  cd "$srcdir/smartplayctl"

  # Install the main script
  install -Dm755 smartplayctl.py "$pkgdir/usr/bin/smartplayctl"

  # Optional documentation and license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
