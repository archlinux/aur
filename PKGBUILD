# Maintainer: Braulio Oliveira <brauliobo at gmail dot com>

pkgname=alacrium-browser-bin
pkgver=151.0.7922.108
pkgrel=1
pkgdesc='Performance-focused Chromium browser tracking stable releases (prebuilt)'
arch=('x86_64')
url='https://github.com/brauliobo/alacrium'
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ttf-liberation'
  'vulkan-icd-loader'
  'xdg-utils'
)
optdepends=(
  'gnome-keyring: password storage in GNOME'
  'kdialog: native file dialogs in KDE'
  'kwallet: password storage in KDE'
  'pipewire: WebRTC desktop sharing under Wayland'
)
provides=("alacrium-browser=${pkgver}")
conflicts=('alacrium-browser')
options=('!debug' '!strip')
_deb="alacrium-browser_${pkgver}_AVX.deb"
_commit=da87c04519399ae99b2546ab2fc7b207e8381a07
source=(
  "https://github.com/brauliobo/alacrium/releases/download/M${pkgver}/${_deb}"
  "LICENSE-${_commit}.md::https://raw.githubusercontent.com/brauliobo/alacrium/${_commit}/LICENSE.md"
)
sha256sums=(
  'e120414e37f3bc76fe379e102d60626bfd909fb38c0b3ae98246d53745a95e35'
  '1d43c681d483ed1bf2e88507be7368eea8d1dedc503d39b8e17e701d0be00fe2'
)
noextract=("$_deb")

package() {
  bsdtar -xOf "$srcdir/$_deb" data.tar.xz | bsdtar -xf - -C "$pkgdir"
  rm -rf "$pkgdir/etc/cron.daily"
  chmod 4755 "$pkgdir/opt/alacrium-browser/chrome-sandbox"
  install -Dm644 "$srcdir/LICENSE-${_commit}.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
