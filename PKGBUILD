# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tailor
pkgver=1.1.2
pkgrel=1
pkgdesc="Create bootable drives"
arch=('x86_64')
url="https://altlinux.space/qualimock/Tailor"
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
source=("git+https://altlinux.space/qualimock/Tailor.git#tag=v$pkgver")
sha256sums=('685efecd3a13c42d7b1e616542dfaae4579fc4603f6f4c6f6c7cd4dd2b3c214a')

build() {
  arch-meson Tailor build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
