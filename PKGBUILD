# Maintainer: Eric Naim <dnaim@cachyos.org>

pkgname=niri-focused-booster
pkgver=0.2.1
pkgrel=2
pkgdesc='dmem cgroup boosting for focused windows on Niri'
arch=(x86_64)
url='https://github.com/1Naim/niri-focused-booster'
license=(GPL-3.0-or-later)
depends=(
  'dmemcg-booster'
  'glibc'
  'libgcc'
  'systemd'
)
makedepends=(
  'cargo'
  'git'
)
source=("${pkgname}::git+$url.git#tag=${pkgver}")
sha256sums=('f68a510891091624f1f45d48526166abfb3819faeebf786782fcbcfc3d68b8d1')

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
