# Maintainer: @aardbol
pkgname=mercurygram-desktop-bin
pkgver=6.9.3.8
pkgrel=1
pkgdesc='Mercurygram Desktop messaging app'
arch=('x86_64' 'aarch64')
url="https://github.com/Mercurygram/mdesktop"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
depends=(
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libdispatch'
  'libgcc'
  'libstdc++'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'openssl'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'zlib'
)
optdepends=(
  'pipewire: audio support'
  'xdg-desktop-portal: desktop integration'
)
options=('!debug' '!strip')

source=(
  "it.belloworld.mercurygram.desktop::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/lib/xdg/it.belloworld.mercurygram.desktop"
  "icon16.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon16.png"
  "icon32.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon32.png"
  "icon48.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon48.png"
  "icon64.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon64.png"
  "icon128.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon128.png"
  "icon256.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon256.png"
  "icon512.png::https://raw.githubusercontent.com/Mercurygram/mdesktop/refs/heads/dev/Telegram/Resources/art/icon512.png"
)
source_x86_64=("https://github.com/Mercurygram/mdesktop/releases/download/v${pkgver}/Mercurygram-${pkgver}-linux-x86_64.tar.xz")
source_aarch64=("https://github.com/Mercurygram/mdesktop/releases/download/v${pkgver}/Mercurygram-${pkgver}-linux-arm64.tar.xz")

sha256sums=('f4e156ad9e71ee0d3f9155d5b0396c6e7bae92f47ab28a9e14a57bd5a63fde16'
            'a1a1ea2d8a1e69a2c3d71c2ddd442f71c614e3abcdb60c54d0f90e4c9d778c88'
            '7b4ee11e84e42335a8ae2d4161fb989152117b2d64d70036973822b93563d6e5'
            'f7b76cc8c9878a5daf550ee9fcb65d0649f54e8e9e356c260d59b51312a057b8'
            'b4e6b66eaf23706ad7a6608f19dfd3bc6cfd906c52a5809eebdba2a6abecdeb4'
            'e7b1f3fdc5b92977f29eb08b6936dd94539da928bac4253ccbc53d9110a4252b'
            '64650964193d328389b2cf4be9fdfb6ccc56b17fb932e46d0589a8c0f779f3cf'
            '3cd0d6b3d46b406e8f2458e744a87d22713f049cf1615269347697e1282577d0')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 Mercurygram "$pkgdir/usr/bin/mercurygram"
  install -Dm755 Updater "$pkgdir/usr/lib/mercurygram/Updater"
  install -Dm644 "$srcdir/it.belloworld.mercurygram.desktop" \
    "$pkgdir/usr/share/applications/it.belloworld.mercurygram.desktop"

  # Install icons
  for size in 16 32 48 64 128 256 512; do
    if [ -f "$srcdir/icon${size}.png" ]; then
      install -Dm644 "$srcdir/icon${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/it.belloworld.mercurygram.png"
    fi
  done
}
