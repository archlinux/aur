# SPDX-License-Identifier: 0BSD
# Maintainer: a-catgirl <paws@a-catgirl.dev>

pkgname=hinoirisetr
pkgver=1.6.4
_pkgver=1.6.4
pkgrel=1
pkgdesc="A lightweight daemon that automatically adjusts your screen's color temperature and gamma based on the time of day"
arch=("i686" "x86_64" "aarch64")
url="https://git.vavakado.xyz/me/hinoirisetr.git"
license=("MIT")
makedepends=("cargo" "git")
source=("git+https://git.vavakado.xyz/me/hinoirisetr.git")
optdepends=(
    "ddcutil: ddcutil backend support"
    "hyprsunset: hyprland backend support"
    "wayland"
    "xsct: xsct backend support"
    "libnotify: desktop notifications support")
sha256sums=("SKIP")
makedepends+=("scdoc")

prepare() {
    cd "$pkgname"
    git config --local advice.detachedHead false
    git checkout tags/v${_pkgver}
}

build() {
    cd "$pkgname"
    cargo build --release

    scdoc < manpages/hinoirisetr.1.sc > manpages/hinoirisetr.1
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hinoirisetr" "$pkgdir/usr/bin/hinoirisetr"
    install -Dm644 "manpages/hinoirisetr.1" "$pkgdir/usr/share/man/man1/hinoirisetr.1"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

