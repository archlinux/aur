# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-nightmode
pkgver=1.3
pkgrel=1
pkgdesc="Persistent Guardian: System Tray Night Mode with Background Alarm Service"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'redshift' 'libpulse' 'libappindicator-gtk3' 'libnotify')
makedepends=('gcc' 'pkg-config')
optdepends=('geoclue: For automatic location mode')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-nightmode 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-nightmode
  gcc shrike-nightmode.c -o shrike-nightmode $(pkg-config --cflags --libs gtk+-3.0 appindicator3-0.1 glib-2.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-nightmode 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-nightmode
  install -Dm755 shrike-nightmode "$pkgdir/usr/bin/shrike-nightmode"
  install -Dm644 shrike-nightmode.desktop "$pkgdir/usr/share/applications/shrike-nightmode.desktop"
  install -Dm644 shrike-alarm.service "$pkgdir/usr/lib/systemd/user/shrike-alarm.service"
}
