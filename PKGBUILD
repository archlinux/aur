# Maintainer: plasmaDestroyer <satyasheel2004@gmail.com>
pkgname=paclens-bin
_pkgname=paclens
pkgver=0.3.4
pkgrel=1
pkgdesc="A TUI-first pacman + AUR + Flatpak inspection and update tool for Arch Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/plasmaDestroyer/paclens"
license=('MIT')
# Same runtime dependencies as the source package — a prebuilt binary changes
# how it was compiled, not what it needs. pacman-contrib is not optional:
# checkupdates is what makes update counts accurate rather than a reading of a
# possibly-stale local sync db, and paccache is what makes the reclaimable
# cache figure honest (design §3).
depends=('gcc-libs' 'glibc' 'pacman' 'pacman-contrib')
# No makedepends at all. Not needing a 292 MiB Rust toolchain to install a
# 1 MiB program is the entire reason this package exists.
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
optdepends=(
  'flatpak: Flatpak app and runtime scanning'
  'paru: AUR update detection and updates (preferred)'
  'yay: AUR update detection and updates'
  'pikaur: AUR update detection and updates'
)
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/paclens-x86_64-unknown-linux-gnu.tar.gz")
# Deliberately not 'SKIP'. A binary package is one someone installs without
# reading what they are installing, so the one thing it must do is verify that
# what arrived is what was published. Refresh with `updpkgsums` on every
# version bump; it must match the sha256sums.txt attached to that release.
sha256sums=('0d19bb5aa9db8281edf9ae3fb1b5f9db03818f0eb851d22f1477dde47001e6bc')

package() {
  install -Dm755 "$srcdir/paclens" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 "$srcdir/config.default.toml" \
    "$pkgdir/usr/share/doc/$_pkgname/config.default.toml"
}
