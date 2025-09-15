# Maintainer: NEOAPPS <asd22.info@gmail.com>
pkgname=obsidianospm-git
pkgver=r2.38fef68
pkgrel=1
pkgdesc="ObsidianOS Package Manager, install pacman packages as ObsidianOS Overlays."
arch=('any')
url="https://github.com/Obsidian-OS/opm"
license=('MIT')
depends=('libobsidianos_overlays-git' 'obsidianctl-git')
makedepends=('git' 'cargo' 'rust')
provides=('opm')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/opm "$pkgdir/usr/bin/opm"
}
