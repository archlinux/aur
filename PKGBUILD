# Maintainer: Tsiry Sandratraina <tsiry.sndr@rocksky.app>

pkgname=rockboxd-bin
_pkgname=rockboxd
pkgver=2026.09.13
pkgrel=1
pkgdesc="A modern, network-enabled music player platform built on Rockbox technology (prebuilt binaries)"
arch=('x86_64' 'aarch64')
url="https://github.com/tsirysndr/rockboxd"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'dbus' 'libffi')
makedepends=('patchelf')
optdepends=('bluez: Bluetooth audio device support'
            'snapcast: synchronised multi-room audio via snapserver')
provides=("$_pkgname=$pkgver" "rockbox=$pkgver")
conflicts=("$_pkgname" 'rockbox' 'rockbox-zig' 'rockbox-zig-bin')
replaces=('rockbox-zig-bin')
options=('!strip' '!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/$pkgver/rockbox_${pkgver}_amd64-linux.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/$pkgver/rockbox_${pkgver}_aarch64-linux.tar.gz")
sha256sums_x86_64=('22052e98906c63acd045c853a9304c9ca5dccdd37aa7627369766cff2473597d')
sha256sums_aarch64=('6b3c7a48593219e7fc25a1d7deeb9cac2540b998d1febe17d3ec9b732b7e9c22')

prepare() {
  # Upstream ships rockboxd with a leftover build-tree RUNPATH (../target/release)
  patchelf --remove-rpath "$srcdir/rockboxd"
}

package() {
  install -Dm755 "$srcdir/rockboxd" "$pkgdir/usr/bin/rockboxd"
  install -Dm755 "$srcdir/rockbox" "$pkgdir/usr/bin/rockbox"
}
