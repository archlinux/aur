# Maintainer: @aardbol
pkgname=codenomad-tauri-bin
pkgver=0.19.0
pkgrel=2
pkgdesc='The AI Coding Cockpit for OpenCode (Tauri-based)'
arch=('x86_64')
url='https://github.com/NeuralNomadsAI/CodeNomad'
license=('MIT')
depends=(
  'glibc'
  'gtk3'
  'webkit2gtk-4.1'
)
optdepends=(
  'libayatana-appindicator: tray icon support'
  'xdg-desktop-portal: desktop integration'
  'opencode: the open source coding agent'
)
provides=('codenomad')
conflicts=('codenomad' 'codenomad-git' 'codenomad-bin')
options=('!debug' '!strip')

source_x86_64=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/CodeNomad-Tauri-linux-x64-${pkgver}.deb")

sha256sums_x86_64=('81e197cea79248f0025c14387802cd678a98d110900696c660714014b2629bfb')

package() {
  # Extract the data payload from the deb (ar archive containing data.tar.gz).
  bsdtar -xf "${pkgname}-${pkgver}.deb" -C "$srcdir" data.tar.gz
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
