# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-themer
pkgver=2.1
pkgrel=1
pkgdesc="Ultimate Screen Color & Brightness Manager with Persistence"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'xorg-xrandr')
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-themer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-themer
  gcc shrike-themer.c -o shrike-themer $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-themer 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-themer
  install -Dm755 shrike-themer "$pkgdir/usr/bin/shrike-themer"
  install -Dm644 shrike-themer.desktop "$pkgdir/usr/share/applications/shrike-themer.desktop"
  
  # Install autostart file to ensure settings restore on boot
  install -Dm644 shrike-themer-restore.desktop "$pkgdir/etc/xdg/autostart/shrike-themer-restore.desktop"
}
