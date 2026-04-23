pkgname=aur-check-rebuild
pkgver=1.2.2
pkgrel=4
pkgdesc='Pacman hook to check and launch rebuild of AUR packages affected by updates'
arch=('x86_64')
url='https://github.com/Emiliopg91/aur-check-rebuild'
license=('GPL-2')
depends=(
  'alacritty'
  'pacman'
  'python'
  'python-pip'
  'python-dataclasses-json'
  'python-psutil'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)
install=${pkgname}.install

package() {
  cd "$srcdir/aur-check-rebuild"

  touch "aur-check-rebuild.log" 

  install -Dm644 "hooks/zz-aur-check-rebuild.hook" "$pkgdir/usr/share/libalpm/hooks/zz-aur-check-rebuild.hook"
  install -Dm755 "scripts/aur-check-rebuild.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild/main.py"
  install -Dm755 "scripts/helpers/libalpm.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild/helpers/libalpm.py"
  install -Dm755 "scripts/helpers/settings.py" "$pkgdir/usr/share/libalpm/scripts/aur-check-rebuild/helpers/settings.py"
  install -Dm644 "settings.json" "$pkgdir/usr/share/aur-check-rebuild/settings-default.json"
  install -Dm644 "aur-check-rebuild.log" "$pkgdir/var/log/aur-check-rebuild.log"
}