# Maintainer: Vikyek <vika.jedr@gmail.com>
pkgname=vlfstatus-git
_pkgname=vlfstatus
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight, feature-packed bash status bar generator for i3bar and swaybar with live AI agent quota tracking"
arch=('any')
url="https://github.com/Vikyek/vlfstatus"
license=('MIT')
depends=('bash' 'networkmanager' 'libpulse')
optdepends=(
  'python: For live AI quota tracking daemon (fetch_quota.py)'
  'python-secretstorage: For reading tokens from system keyring'
  'agy-cli: For checking/displaying Google Cloud Code quota'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${pkgname}::git+https://github.com/Vikyek/vlfstatus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -Dm755 vlfstatus "$pkgdir/usr/bin/vlfstatus"
  install -Dm644 man1/vlfstatus.1 "$pkgdir/usr/share/man/man1/vlfstatus.1"
  install -Dm644 fetch_quota.py "$pkgdir/usr/share/vlfstatus/fetch_quota.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
