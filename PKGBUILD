# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme-with-gnome-darkmode-git"
pkgver=r38.b78482c
pkgrel=1
pkgdesc="::Rolling release:: Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray"
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode"
license=('GPL-1.0-or-later')
depends=('bash' 'awk' 'alacritty-use-theme')
makedepends=('git')
provides=('alacritty-listen-to-colorscheme.service')
conflicts=('alacritty-use-theme-with-gnome-darkmode')
replaces=('alacritty-toggle-theme-on-darkmode-git')
source=("$pkgname::git+https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  # systemd units
  install -Dm755 $srcdir/$pkgname/app/home/config/systemd/user/alacritty-listen-to-colorscheme.service "$pkgdir/usr/lib/systemd/user/alacritty-listen-to-colorscheme.service"

  # toggle-mode-on-dbus-signal
  install -Dm755 $srcdir/$pkgname/app/home/local/alacritty-use-theme/bin/toggle-mode-on-signal.sh "$pkgdir/usr/bin/alacritty-use-theme/toggle-mode-on-signal.sh"

  # documentation
  install -Dm644 $srcdir/$pkgname/docs/alacritty-toggle-theme-on-darkmode.md "$pkgdir/usr/share/docs/$pkgname/README.md"
}

