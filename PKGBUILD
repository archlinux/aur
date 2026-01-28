# Maintainer: Osman Dulundu <osman@dulundu.dev>
pkgname=pomodoro-tauri-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A professional Pomodoro Timer built with Tauri and React (pre-built binary)"
arch=('x86_64')
url="https://github.com/ravidulundu/pomodoro"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'libayatana-appindicator' 'sqlite')
provides=('pomodoro-tauri')
conflicts=('pomodoro-tauri')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pomodoro-tauri-$pkgver-x86_64.tar.gz")
sha256sums=('e5a12baa226072359ced6167027a73ef6c1d6438a44a4c3056d4716480ac9361')

package() {
  # Binary
  install -Dm755 "pomodoro" "$pkgdir/usr/bin/pomodoro-tauri"

  # Ses dosyaları ve tray icon'ları
  install -d "$pkgdir/usr/share/pomodoro-tauri"
  install -Dm644 sounds/*.ogg -t "$pkgdir/usr/share/pomodoro-tauri/"
  install -Dm644 work.png "$pkgdir/usr/share/pomodoro-tauri/work.png"
  install -Dm644 short-break.png "$pkgdir/usr/share/pomodoro-tauri/short-break.png"
  install -Dm644 long-break.png "$pkgdir/usr/share/pomodoro-tauri/long-break.png"

  # Uygulama ikonları (XDG hicolor tema)
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "icons/${size}x${size}/kde-pomodoro.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/pomodoro-tauri.png"
  done
  install -Dm644 "icons/kde-pomodoro.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pomodoro-tauri.svg"

  # Desktop Entry
  install -Dm644 "pomodoro-tauri.desktop" \
    "$pkgdir/usr/share/applications/pomodoro-tauri.desktop"
}
