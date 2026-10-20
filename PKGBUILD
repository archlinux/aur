# Maintainer: AuthenticSm1les <khidarlaminehamdi@gmail.com>
pkgname=libcosmic-git
_pkgname=libcosmic
pkgver=1.0.0.r1034.46fcb08
pkgrel=1
pkgdesc="GUI platform toolkit for developing COSMIC applications and applets"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/libcosmic"
license=('MPL-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'freetype2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libinput'
  'libjpeg-turbo'
  'libpipewire'
  'libpng'
  'libwebp'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pixman'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
  'wayland-protocols'
)
makedepends=(
  'cargo'
  'cmake'
  'git'
  'just'
  'pkgconf'
)
provides=('libcosmic')
conflicts=('libcosmic')
source=("git+https://github.com/pop-os/libcosmic.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

package() {
  cd "$_pkgname"
  install -Dm0755 "target/release/libcosmic.so" "$pkgdir/usr/lib/libcosmic.so"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
