# Maintainer: undefined-ux <undefined_1@outlook.com>
pkgname=astragram-desktop
pkgver=7.3.3.4
pkgrel=1
pkgdesc='Customizable Telegram desktop client based on AyuGram (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Kindness-Kismet/AstraGram-Desktop'
license=('GPL-3.0-only WITH LicenseRef-OpenSSL-exception')
depends=(
  'alsa-lib'
  'bash'
  'cairo'
  'dbus'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'libdrm'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'pango'
  'wayland'
  'xcb-util-keysyms'
)
checkdepends=('desktop-file-utils')
optdepends=(
  'geoclue: Location sharing'
  'gtk3: Native GTK file dialogs and desktop integration'
  'libpulse: PulseAudio support'
  'libva: VA-API hardware video acceleration'
  'libvdpau: VDPAU hardware video acceleration'
  'mesa: OpenGL rendering and GBM support'
  'webkit2gtk-4.1: Embedded web content'
  'xdg-desktop-portal: Desktop portals and screen sharing'
)
# Upstream retains AyuGram's desktop and D-Bus application ID.
conflicts=('ayugram-desktop' 'ayugram-desktop-bin' 'ayugram-desktop-git')
options=('!strip' '!debug')

_app_id=com.ayugram.desktop
_raw="https://raw.githubusercontent.com/Kindness-Kismet/AstraGram-Desktop/v$pkgver"
source=(
  'astragram-desktop'
  "${_app_id}.desktop"
  "astragram-$pkgver.svg::$_raw/Telegram/Resources/art/extras/default/app.svg"
  "LICENSE-$pkgver::$_raw/LICENSE"
)
source_x86_64=("$url/releases/download/v$pkgver/AstraGram-v$pkgver-linux-x64.zip")
source_aarch64=("$url/releases/download/v$pkgver/AstraGram-v$pkgver-linux-arm64.zip")
sha256sums=(
  'ec6b77d1c62eefd8b5f0e041c4b65d8ca14e0645c2e844b8e2f38481cdce8b7e'
  'c919523ff7cf99e09136597752dc3455f3cede8d2b98c9dc2335a16343e95208'
  '98ce750f3bcf580df94d4e8509b6244f845532c23e7d7bd947da2c81d5000569'
  '30e52a0e4d8207c631458d98be89adcadf5b60e2608fe9c9a3eff1cde1877c8e'
)
sha256sums_x86_64=('9dcda0d3a393e90b0b50a46d703d15c6c0d887f96a6ae9854c28f48cc2244a7d')
sha256sums_aarch64=('c421b039f7e6bebbb6e41f61adec76a733dc93afd92dfa88ce9bb4133438a8e4')

check() {
  desktop-file-validate "${_app_id}.desktop"
  bash -n astragram-desktop
  test -s AstraGram
  test -s Updater
}

package() {
  install -Dm755 AstraGram Updater -t "$pkgdir/opt/$pkgname/"
  install -Dm755 astragram-desktop "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${_app_id}.desktop" \
    -t "$pkgdir/usr/share/applications/"
  install -Dm644 "astragram-$pkgver.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_app_id}.svg"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
