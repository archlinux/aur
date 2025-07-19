# Maintainer: Swapnanil1 <swapnanil.chrome333@passinbox.com>

pkgname=zenbrowser
pkgver=1.14.5b
pkgrel=1
pkgdesc="Performance oriented Firefox-based web browser (Minimal Modified PKGBUILD)"
arch=('x86_64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd)
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'libnotify: Notification integration'
            'pulse-native-provider: Audio support')
options=(!strip)
provides=("zenbrowser=$pkgver")
conflicts=('zen-browser' 'zen-browser-bin' 'zenbrowser')

source_x86_64=("https://github.com/zen-browser/desktop/releases/download/$pkgver/zen.linux-x86_64.tar.xz")
sha256sums_x86_64=('ce3f8952a5e468d6569dd6d86764221bbf2d4582bd6aaa4dc6e8ba3ca314858e')


package() {
  install -d "$pkgdir"/opt
  cp -r zen/ "$pkgdir"/opt/$pkgname

  # Create .desktop file that points directly to the executable /opt/
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Zen Browser
Exec=/opt/$pkgname/zen %u
Icon=$pkgname
Type=Application
Terminal=false
Categories=Network;WebBrowser;
EOF

  # Link the application icons for the desktop environment
  for size in 16 32 48 64 128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/
    ln -s "/opt/$pkgname/browser/chrome/icons/default/default${size}.png" \
          "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
  done
}
