# Maintainer: Eric Naim <dnaim@cachyos.org>

pkgname=niri-focused-booster
pkgver=0.2.0
pkgrel=1
pkgdesc='dmem cgroup boosting for focused windows on Niri'
arch=(x86_64)
url='https://github.com/1Naim/niri-focused-booster'
license=(GPL-3.0-or-later)
depends=(
  'dmemcg-booster'
  'glibc'
  'libgcc'
  'niri-git'
  'systemd'
)
makedepends=(
  'cargo'
  'git'
)
source=("${pkgname}::git+$url.git#tag=${pkgver}")
sha256sums=('bac60506c997ecdf0dd9139886b75c3fd5672810ce8f115c0b38cef30d6dfc88')

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${pkgname}"
  cargo build --release --frozen
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}

# vim: set sts=2 sw=2 et:
