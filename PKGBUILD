# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme-with-redshift"
pkgver=1.0.0
pkgrel=1
pkgdesc="Changes alacritty theme based on the current time and locale"
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-redshift"
license=('GPL-1.0-or-later')
groups=('alacritty-use-theme' 'alacritty-use-theme-services')
depends=('redshift' 'alacritty-use-theme')
provides=('alaritty-use-theme-with-redshift.service' 'alaritty-use-theme-with-redshift.timer' 'alaritty-use-theme-with-redshift.target')
conflicts=('alacritty-use-theme-with-redshift-git')
source=("$pkgname-$pkgver::https://github.com/alacritty-use-theme/alacritty-use-theme-with-redshift/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('184d4e18f99a1a516321a54928c399a0a3597732c36c6d79b0b05e52a411aba1')

pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname-$pkgver"

  # systemd units
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/systemd/user/alacritty-use-theme.timer "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.timer"
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/systemd/user/alacritty-use-theme.target "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.target"
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/systemd/user/alacritty-use-theme.service "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.service"
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/systemd/user/update-gtk-theme.service "$pkgdir/usr/lib/systemd/user/update-gtk-theme.service"

  #config
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/config/theme-switcher/environment.env "$pkgdir/usr/lib/alacritty-use-theme/environment.env"

  # scripts
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/theme-switcher.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/theme-switcher.sh"

  install -Dm777 $srcdir/$pkgname-$pkgver/app/home/local/share/theme-switcher/toggle-theme-per-mode.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/toggle-theme-per-mode.sh"

  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/bin/get-sunrise-sunset.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/get-sunrise-sunset.sh"
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/bin/update-gdm.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/update-gdm.sh"

  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/src/utils/debug.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/debug.sh"
  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/src/utils/is_theme_locked.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/is_theme_locked.sh"

  install -Dm755 $srcdir/$pkgname-$pkgver/app/home/local/theme-switcher/src/shared-variables.sh "$pkgdir/usr/share/alacritty-use-theme/theme-switcher/shared-variables.sh"
  install -Dm777 $srcdir/$pkgname-$pkgver/app/home/config/theme-switcher/mode "$pkgdir/usr/lib/alacritty-use-theme/theme-switcher/mode"


}

