pkgname=rovibe
pkgver=0.2.2
pkgrel=1
pkgdesc='OS-level identity and permission isolation for AI coding agents'
arch=(any)
url='https://github.com/knowlen/rovibe'
license=(WTFPL)
depends=(bash git)
optdepends=('bats: integration test suite (run: sudo bats tests/isolation.bats)'
             'apparmor: kernel-level execution sandboxing for agent sessions')
source=("$pkgname-$pkgver.tar.gz::https://github.com/knowlen/rovibe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac8798ca5b666b44b0c40569079e99073f77c4ed83b040725cbb3c68021db2d1')
install=rovibe.install

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rovibe "$pkgdir/usr/local/bin/rovibe"
  install -dm755 "$pkgdir/usr/local/lib/rovibe"
  for f in lib/*; do
    install -Dm755 "$f" "$pkgdir/usr/local/lib/rovibe/$(basename "$f")"
  done
}
