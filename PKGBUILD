pkgname=archlinux-studio-tweaks
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://aur.archlinux.org/packages/$pkgname"
license=('GPL')
depends=('i2c-tools' 'zram-generator' 'systemd')
optdepends=('flatpak: Install flathub repo as a user')
pkgdesc="Archlinux Studio Tweaks"
source=("40-hpet-permissions.rules"
        "50-sata-pm.rules"
        "60-ioschedulers.rules"
        "69-hdparm.rules"
        "99-cpu-dma-latency.rules"
        "99-ntsync.rules"
        "99-max_map_count.conf"
        "99-max_user_watches.conf"
        "99-swappiness.conf"
        "btrfs_first_run.sh"
        "enable_flatpak_as_user.sh"
        "i2c-dev.conf"
        "max_rtc_timer.sh"
        "rtc_timer_tweak.service"
        "zram-generator.conf")
sha256sums=('08beea3d5594cdb9f78ad9302b6c4d8e89003a9fbd401c9f7b10f2cba23edecb'
            '47a57c2a2f3a9a5fef35b6ebfd1b618e1db8542d01cf06ea1e00182c0ef21496'
            'd9b2754a7d30608418a9c8681397e91ca238235035068d5598fa2171434cb7fc'
            '988fad97e9afb8350ce55bb23931504279fbcad08b604975157748d992dd1a6e'
            'da5e37a3005948e307a109aa9e8e6e1c70273fefb9cfbd48690cb4fce9b56859'
            'ce5221146a19206ba043211db8f27143a82f9224c0aff24a0b584b7268fcb994'
            'c7e3887ec656c47548cf9a045c098240d314a8473660cf5c584ed3a2b43d4fcb'
            '45ac88d8ce546a42e451e31a35f36c4ecfa7483d33b156cde5c4878085bfbb29'
            'a7b7a3e68e1e38ef859c444a466276ae8859ec1aeba6c3f50faf2bbd37ca0e76'
            '86196ebd197826e7916c91893ae4189a3d7da56d0df08ed62a0e65e116966953'
            '6aa4d21cb5ed04fb1fc95be7e4ee5931b4b6e0572b5d404c5635383c5f26fc92'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2'
            '7b0a0f12f12f652cbd4e468339fd6e5761b80fbdd6d0471b8d3ab75622779f8d'
            '969db5e4a561ec03f3996d057b8281fddf4a04fe013de4c2baba91467b895206'
            '231ab5d22f2dd7341541f6295cabbc9e9d4f50e06418f2f60703090a44b1eff9')

package() {
  ## Install hpet permissions rules
  install -Dm644 "$srcdir/40-hpet-permissions.rules" "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"

  ## Install sata power management rules
  install -Dm644 "$srcdir/50-sata-pm.rules" "$pkgdir/usr/lib/udev/rules.d/50-sata-pm.rules"

  ## Install io scheduler rules
  install -Dm644 "$srcdir/60-ioschedulers.rules" "$pkgdir/usr/lib/udev/rules.d/60-ioschedulers.rules"

  ## Install hd parameter rules
  install -Dm644 "$srcdir/69-hdparm.rules" "$pkgdir/usr/lib/udev/rules.d/69-hdparm.rules"

  ## Install cpu dma latency fix rules
  install -Dm644 "$srcdir/99-cpu-dma-latency.rules" "$pkgdir/usr/lib/udev/rules.d/99-cpu-dma-latency.rules"

  ## Install ntsync rules
  install -Dm644 "$srcdir/99-ntsync.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntsync.rules"

  ## Install max map file allocation config
  install -Dm644 "$srcdir/99-max_map_count.conf" "$pkgdir/etc/sysctl.d/99-max_map_count.conf"

  ## Install system inotify watches config
  install -Dm644 "$srcdir/99-max_user_watches.conf" "$pkgdir/etc/sysctl.d/99-max_user_watches.conf"

  ## Install swapiness config
  install -Dm644 "$srcdir/99-swappiness.conf" "$pkgdir/etc/sysctl.d/99-swappiness.conf"

  ## Install BTRFS first run script
  install -Dm755 "$srcdir/btrfs_first_run.sh" "$pkgdir/etc/skel/Desktop/btrfs_first_run.sh"

  ## Install flatpak (user) script
  install -Dm755 "$srcdir/enable_flatpak_as_user.sh" "$pkgdir/etc/skel/Desktop/enable_flatpak_as_user.sh"

  ## Install i2c-dev config
  install -Dm644 "$srcdir/i2c-dev.conf" "$pkgdir/etc/modules-load.d/i2c-dev.conf"

  ## Install rtc timer tweak script
  install -Dm755 "$srcdir/max_rtc_timer.sh" "$pkgdir/usr/bin/max_rtc_timer.sh"

  ## Install rtc timer tweaks config
  install -Dm644 "$srcdir/rtc_timer_tweak.service" "$pkgdir/etc/systemd/system/rtc_timer_tweak.service"

  ## Install zram config
  install -Dm644 "$srcdir/zram-generator.conf" "$pkgdir/etc/systemd/zram-generator.conf"
}
