# Maintainer: BananaBrother77 <me@bananabrother77.online>
# Contributor: (you can add your name here later)

# AUR package name includes -bin to mark it as prebuilt.
# _pkgname is the upstream name (without -bin), used to construct
# the download URL since the GitHub artifact doesn't have -bin.
_pkgname=bananadashboard
pkgname=${_pkgname}-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Desktop system dashboard by BananaBrother77"
arch=('x86_64')
url="https://github.com/BananaBrother77/BananaDashboard"
license=('MIT')

# These are the same libraries Electron needs — they'll be pulled
# in automatically when the user installs via pacman.
depends=(
  'gtk3'
  'nss'
  'libxss'
  'libxtst'
  'alsa-lib'
)

# "provides" + "conflicts" let users install bananadashboard-bin
# even if something requires "bananadashboard" — they're interchangeable.
provides=('bananadashboard')
conflicts=('bananadashboard')

# Source is the .pacman file from your GitHub release.
# The artifact is named _pkgname, not pkgname (no -bin suffix).
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman")

# SKIP skips checksum verification. For a real AUR package you'd
# replace this with the actual SHA256 hash after each release.
sha256sums=('SKIP')

# No build() needed — we're downloading a prebuilt package.
# package() just extracts the .pacman into $pkgdir (the package root).
# bsdtar handles .tar.zst (zstd-compressed tar) which is what .pacman is.
package() {
  bsdtar -xvf "$srcdir/$_pkgname-$pkgver.pacman" -C "$pkgdir"
  rm -f "$pkgdir/.INSTALL" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
