# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-wifi-qr
pkgver=1.0
pkgrel=1
pkgdesc="Validates WiFi passwords via NetworkManager and generates QR codes"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=('gtk3' 'qrencode' 'wireless_tools' 'networkmanager' 'libnotify')
makedepends=('gcc' 'pkg-config')

# Download the main branch directly from Codeberg
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  # Find the folder (Codeberg names it after the repo)
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-wifi-qr 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-wifi-qr
  
  gcc shrike-wifi-qr.c -o shrike-wifi-qr $(pkg-config --cflags --libs gtk+-3.0 libnotify)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-wifi-qr 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-wifi-qr
  
  install -Dm755 shrike-wifi-qr "$pkgdir/usr/bin/shrike-wifi-qr"
  install -Dm644 shrike-wifi-qr.desktop "$pkgdir/usr/share/applications/shrike-wifi-qr.desktop"
}
