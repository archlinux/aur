# Maintainer: Yahya Zekry <yahyazekry@gmail.com>

pkgname=internet-usage-monitor-git
_pkgname_src=internet-usage-monitor
pkgver=r54.b473243
pkgrel=1
pkgdesc="Monitors internet usage in real-time via Conky with desktop notifications (git version)"
arch=('any')
provides=("internet-usage-monitor=${pkgver}")
conflicts=('internet-usage-monitor')
url="https://github.com/YahyaZekry/internet-usage-monitor"
license=('MIT')
depends=('bash' 'conky' 'bc' 'procps-ng' 'libnotify' 'zenity')
makedepends=('git')
install=${pkgname}.install
source=("${_pkgname_src}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname_src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname_src"

  install -Dm755 "install.sh" "$pkgdir/usr/bin/internet-monitor-setup"
  install -Dm755 "uninstall.sh" "$pkgdir/usr/bin/internet-monitor-uninstall"
  
  install -Dm755 "src/internet_monitor.sh" "$pkgdir/usr/share/$pkgname/src/internet_monitor.sh"
  install -Dm755 "src/conky_usage_helper.sh" "$pkgdir/usr/share/$pkgname/src/conky_usage_helper.sh"
  install -Dm755 "fix_conky_kde.sh" "$pkgdir/usr/share/$pkgname/fix_conky_kde.sh"
  
  install -Dm644 "config/config.sh" "$pkgdir/usr/share/$pkgname/config/config.sh"
  install -Dm644 "config/conkyrc_internet" "$pkgdir/usr/share/$pkgname/config/conkyrc_internet"
  
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
