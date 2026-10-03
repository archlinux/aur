# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tailor
pkgver=1.2.0
pkgrel=1
pkgdesc="Create bootable drives"
arch=('x86_64')
url="https://altlinux.space/alt-gnome/Tailor/"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
  'libosinfo'
  'libsoup3'
  'udisks2'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/Tailor.git#tag=v$pkgver")
sha256sums=('731b959bfb59e8275903bf16cc12759c700d6a81736d4572d5af374cf6985cef')

build() {
  arch-meson Tailor build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
