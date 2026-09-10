# Maintainer: Tsiry Sandratraina <tsiry.sndr@rocksky.app>

pkgname=rockboxd-bin
_pkgname=rockboxd
pkgver=2026.09.10
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
sha256sums_x86_64=('d4c7231da00e98680dd8f1ae5e1fe359dc19839124f5c658669a1b576760f274')
sha256sums_aarch64=('946858a8d84b8bf74c175b4810c95ad9ecc5a3c8c320189d52d2509b5a1290d7')

prepare() {
  # Upstream ships rockboxd with a leftover build-tree RUNPATH (../target/release)
  patchelf --remove-rpath "$srcdir/rockboxd"
}

package() {
  install -Dm755 "$srcdir/rockboxd" "$pkgdir/usr/bin/rockboxd"
  install -Dm755 "$srcdir/rockbox" "$pkgdir/usr/bin/rockbox"
}
