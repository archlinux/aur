# Maintainer: @aardbol
pkgname=codenomad-tauri-bin
pkgver=0.20.0
pkgrel=1
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

sha256sums_x86_64=('aeb27c742703dbf5fffa2fffe23a95231748e0e4c288bd2bf018a8b0dd9794b1')

package() {
  # Extract the data payload from the deb (ar archive containing data.tar.gz).
  bsdtar -xf "${pkgname}-${pkgver}.deb" -C "$srcdir" data.tar.gz
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
