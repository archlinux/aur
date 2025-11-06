# Maintainer: Mikołaj Ziółkowski <mikolajziolkowski504@gmail.com>
pkgname=pacman-ostree
pkgver=r52
pkgrel=1
pkgdesc="OSTree integration for Arch Linux (like rpm-ostree)"
arch=('x86_64')
url="https://github.com/ImmutableArch/pacman-ostree"
license=('GPL')
depends=('pacman' 'ostree' 'rust' 'git' 'arch-install-scripts' 'bootc-git' )
makedepends=('git' 'base-devel')
source=("git+https://github.com/ImmutableArch/pacman-ostree.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo "r$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  # Kopiowanie skompilowanego pliku wykonywalnego
  install -Dm755 target/release/pacman-ostree "$pkgdir/usr/bin/pacman-ostree"

  # Kopiowanie plików konfiguracyjnych do /etc/tmpfiles.d/
  mkdir -p "$pkgdir/etc/tmpfiles.d"
  cp src/*.conf "$pkgdir/etc/tmpfiles.d/"
}
