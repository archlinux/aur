# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="gnome-night-shift-git"
pkgver=r23.a3e04d5
pkgrel=1
pkgdesc="::Rolling release:: A Small utility to switch the selected preferred mode."
arch=('any')
url="https://github.com/christophermca/gnome-night-shift"
license=('GPL-1.0-or-later')
makedepends=('git')
provides=('get-sunrise-sunset.service' 'get-sunrise-sunset.timer' 'gnome-night-shift.service' 'gnome-night-shift.timer' 'auto-update-gnome-theme.path' 'auto-update-gnome-theme.service')
conflicts=( 'gnome-mode-shift-git'
            'alacritty-use-theme-with-redshift'
            'alacritty-use-theme-with-redshift-git')
source=("$pkgname::git+https://github.com/christophermca/gnome-night-shift.git/")
sha256sums=('SKIP')
depends=( 'bash' 'python' )

pkgver() {
   cd "$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

   package() {
      cd "$pkgname"
      # options and directives that can be overridden
      pkgdesc="::Rolling release:: Changes gnomes perferred mode based on sunrise/sunset"
      install=gnome-night-shift-git.install

      # systemd units
      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/auto-update-gnome-theme.service "$pkgdir/usr/lib/systemd/user/auto-update-gnome-theme.service"
      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/auto-update-gnome-theme.path "$pkgdir/usr/lib/systemd/user/auto-update-gnome-theme.path"

      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/get-sunrise-sunset.service "$pkgdir/usr/lib/systemd/user/get-sunrise-sunset.service"
      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/get-sunrise-sunset.timer "$pkgdir/usr/lib/systemd/user/get-sunrise-sunset.timer"

      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/gnome-night-shift.service "$pkgdir/usr/lib/systemd/user/gnome-night-shift.service"
      install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/gnome-night-shift.timer "$pkgdir/usr/lib/systemd/user/gnome-night-shift.timer"

      # scripts
      install -Dm755 $srcdir/$pkgname/app/home/local/bin/auto-update-gnome-theme.sh "$pkgdir/usr/lib/gnome-night-shift/bin/auto-update-gnome-theme.sh"
      install -Dm755 $srcdir/$pkgname/app/home/local/bin/get-sunrise-sunset.py "$pkgdir/usr/lib/gnome-night-shift/bin/get-sunrise-sunset.py"
      install -Dm755 $srcdir/$pkgname/app/home/local/bin/is_day_or_night.sh "$pkgdir/usr/lib/gnome-night-shift/bin/is_day_or_night.sh"

      # vars
      install -Dm644 $srcdir/$pkgname/app/home/local/gnome-night-shift/shared-variables.sh "$pkgdir/usr/lib/gnome-night-shift/shared-variables.sh"
  }
