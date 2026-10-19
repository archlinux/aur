# Maintainer: Eser KUBALI <eserlxl@gmail.com>
# makepkg reads these variables and supplies srcdir/pkgdir.
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=linux-cleaner
pkgver=1.6.0
pkgrel=1
pkgdesc="Safe, configuration-driven cleaner for caches and temporary files"
arch=('any')
url="https://github.com/eserlxl/cleaner"
license=('GPL-3.0-or-later')
depends=('bash>=4.4' 'findutils' 'coreutils')
optdepends=('pacman-contrib: paccache-based package-cache actions'
            'libnotify: desktop notifications for --notify'
            'git: skip cleanup targets that hold git-tracked files')
backup=('etc/linux-cleaner/cleaner.conf')
install=linux-cleaner.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Pinned sha256 of the v$pkgver release tarball. After each version bump, run
# `updpkgsums` once the tag is pushed (see RELEASING.md "Packaging"); never
# publish with 'SKIP'.
sha256sums=('22fbc79c3093556ee24b49a97fc3bce43b330fb67fc28b176519fd282eea92d6')

package() {
  cd "$srcdir/cleaner-$pkgver" || return 1
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
