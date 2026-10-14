# Maintainer: broroeror <54515333+broroeror@users.noreply.github.com>
pkgname=plasma-panel-sync
pkgver=0.2.0
pkgrel=1
pkgdesc="Keep matching KDE Plasma 6 panels in sync across multiple screens"
arch=('any')
url="https://github.com/broroeror/plasma-panel-sync"
license=('MIT')
depends=('python' 'qt6-tools' 'plasma-workspace')
makedepends=('git')
install=plasma-panel-sync.install
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd "$pkgname"
  python -m py_compile panelsync.py
}

package() {
  cd "$pkgname"
  install -Dm755 panelsync.py "$pkgdir/usr/bin/plasma-panel-sync"
  install -Dm644 packaging/plasma-panel-sync.service \
    "$pkgdir/usr/lib/systemd/user/plasma-panel-sync.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
