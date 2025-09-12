# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=obsidianctl-git
pkgver=r25.e924876
pkgrel=1
pkgdesc="ObsidianOS's special program to manage A/B Partitions"
arch=('any')
url="https://github.com/Obsidian-OS/obsidianctl"
license=('MIT')
depends=('python' 'efibootmgr' 'parted' 'dosfstools' 'squashfs-tools' 'rsync' 'coreutils' 'e2fsprogs' 'systemd' 'util-linux' 'procps-ng')
optdepends=('libobsidianos_overlays: For ObsidianOS Extensions support')
makedepends=('git' 'make')
provides=('obsidianctl')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 obsidianctl "$pkgdir/usr/bin/obsidianctl"
}
