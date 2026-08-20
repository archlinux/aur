# Maintainer: @aardbol
pkgname=mercurygram-desktop-bin
_pkgname=mercurygram
pkgver=7.0.9.3
pkgrel=2
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
  "it.belloworld.${_pkgname}.desktop::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/lib/xdg/it.belloworld.${_pkgname}.desktop"
  "${pkgname}-icon16.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon16.png"
  "${pkgname}-icon32.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon32.png"
  "${pkgname}-icon48.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon48.png"
  "${pkgname}-icon64.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon64.png"
  "${pkgname}-icon128.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon128.png"
  "${pkgname}-icon256.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon256.png"
  "${pkgname}-icon512.png::https://raw.githubusercontent.com/${_pkgname^}/mdesktop/refs/heads/dev/Telegram/Resources/art/icon512.png"
)
source_x86_64=("https://github.com/${_pkgname^}/mdesktop/releases/download/v${pkgver}/${_pkgname^}-${pkgver}-linux-x86_64.tar.xz")
source_aarch64=("https://github.com/${_pkgname^}/mdesktop/releases/download/v${pkgver}/${_pkgname^}-${pkgver}-linux-arm64.tar.xz")

sha256sums=('f4e156ad9e71ee0d3f9155d5b0396c6e7bae92f47ab28a9e14a57bd5a63fde16'
            'a1a1ea2d8a1e69a2c3d71c2ddd442f71c614e3abcdb60c54d0f90e4c9d778c88'
            '7b4ee11e84e42335a8ae2d4161fb989152117b2d64d70036973822b93563d6e5'
            'f7b76cc8c9878a5daf550ee9fcb65d0649f54e8e9e356c260d59b51312a057b8'
            'b4e6b66eaf23706ad7a6608f19dfd3bc6cfd906c52a5809eebdba2a6abecdeb4'
            'e7b1f3fdc5b92977f29eb08b6936dd94539da928bac4253ccbc53d9110a4252b'
            '64650964193d328389b2cf4be9fdfb6ccc56b17fb932e46d0589a8c0f779f3cf'
            '3cd0d6b3d46b406e8f2458e744a87d22713f049cf1615269347697e1282577d0')
sha256sums_x86_64=('619401682ebbea551081abe2fc5b689f865bb877f2ff7e3a0bffe50868e8130a')
sha256sums_aarch64=('86e14f658986c98146b8f4b0905bfabb8c86f33f6808bb0530da1428c37dbdda')

package() {
  install -Dm755 ${_pkgname^} "$pkgdir/usr/bin/${_pkgname}"
  install -Dm755 Updater "$pkgdir/usr/lib/${_pkgname}/Updater"
  install -Dm644 "$srcdir/it.belloworld.${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/it.belloworld.${_pkgname}.desktop"

  # Install icons
  for size in 16 32 48 64 128 256 512; do
    if [ -f "$srcdir/${pkgname}-icon${size}.png" ]; then
      install -Dm644 "$srcdir/${pkgname}-icon${size}.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/it.belloworld.${_pkgname}.png"
    fi
  done
}
