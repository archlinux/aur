# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-caffeine-berchi
_pkgname=caffeine-cosmic
pkgver=1.2.0
pkgrel=1
pkgdesc='Caffeine for COSMIC – Prevent screen sleep, display timeout, and system suspend. Native Rust applet with timer options and multiple inhibit modes.'
arch=('x86_64' 'aarch64')
url='https://github.com/Oussamaberchi/caffeine-cosmic'
license=('MIT')
depends=('cosmic-applets')
makedepends=('cargo' 'just')
conflicts=('cosmic-ext-applet-caffeine-berchi-git')
provides=('cosmic-ext-applet-caffeine-berchi')
source=("https://github.com/Oussamaberchi/caffeine-cosmic/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('32bca469114ba5907b977af5ac046c562c36244e592c8d6c646e4e61305779bf')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  just build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "target/release/cosmic-caffeine" "$pkgdir/usr/bin/cosmic-caffeine"
  install -Dm644 "assets/com.github.cosmic-caffeine.desktop" "$pkgdir/usr/share/applications/com.github.cosmic-caffeine.desktop"
  install -Dm644 "assets/oussama-berchi-caffeine-cosmic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/oussama-berchi-caffeine-cosmic.svg"
}
