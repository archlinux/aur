# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="alacritty-use-theme-with-redshift-git"
pkgver=r50.6cbd02a
pkgrel=1
pkgdesc="::Rolling release:: Changes alacritty theme based on the current time and locale"
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-redshift"
license=('GPL-1.0-or-later')
depends=('bash' 'redshift' 'alacritty-use-theme')
makedepends=('git')
provides=('alaritty-use-theme-with-redshift.service' 'alaritty-use-theme-with-redshift.timer' 'alaritty-use-theme-with-redshift.target')
conflicts=('alacritty-use-theme-with-redshift')
source=("$pkgname::git+https://github.com/alacritty-use-theme/alacritty-use-theme-with-redshift.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  # systemd units
  install -Dm755 $srcdir/$pkgname/app/home/config/systemd/user/alacritty-use-theme.timer "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.timer"
  install -Dm755 $srcdir/$pkgname/app/home/config/systemd/user/alacritty-use-theme.target "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.target"
  install -Dm755 $srcdir/$pkgname/app/home/config/systemd/user/alacritty-use-theme.service "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.service"
  install -Dm755 $srcdir/$pkgname/app/home/config/systemd/user/update-gtk-theme.service "$pkgdir/usr/lib/systemd/user/update-gtk-theme.service"

  #config
  install -Dm755 $srcdir/$pkgname/app/home/config/theme-switcher/environment.env "$pkgdir/usr/lib/alacritty-use-theme/environment.env"

  # scripts
  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/theme-switcher.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/theme-switcher.sh"

  install -Dm755 $srcdir/$pkgname/app/home/local/share/theme-switcher/toggle-theme-per-mode.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/toggle-theme-per-mode.sh"

  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/bin/get-sunrise-sunset.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/get-sunrise-sunset.sh"
  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/bin/update-gdm.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/update-gdm.sh"

  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/src/utils/debug.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/debug.sh"
  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/src/utils/is_theme_locked.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/is_theme_locked.sh"
  install -Dm755 $srcdir/$pkgname/app/home/local/theme-switcher/src/shared-variables.sh "$pkgdir/usr/share/alacritty-use-theme/theme-switcher/shared-variables.sh"
  install -Dm777 $srcdir/$pkgname/app/home/config/theme-switcher/mode "$pkgdir/usr/share/alacritty-use-theme/theme-switcher/mode"


}

