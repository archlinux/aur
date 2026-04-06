# Maintainer: Your Name <your@email.com>
pkgname=wrain-git
pkgver=0.1.7.r0.g1234567
pkgrel=1
pkgdesc="GPU accelerated rain wallpaper for Wayland (Source)"
arch=('x86_64')
url="https://github.com/happyzxzxz/wrain"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'vulkan-icd-loader' 'alsa-lib' 'xkeyboard-config')
makedepends=('cargo' 'git')
provides=('wrain')
conflicts=('wrain' 'wrain-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd wrain
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd wrain
  cargo build --release --locked
}

package() {
  cd wrain
  install -Dm755 "target/release/wrain" "$pkgdir/usr/bin/wrain"
  install -d "$pkgdir/usr/share/wrain/assets"
  cp -r assets/* "$pkgdir/usr/share/wrain/assets/"
}
