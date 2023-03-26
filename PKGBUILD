# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Michael Duell < mail at akurei dot me >
# Contributor: Daniel J. Campos <dcampos2015 at my dot fit dot edu>

pkgname=btrbk-git
pkgver=0.32.6.r0.g5e44bc6
pkgrel=1
pkgdesc="Tool for creating snapshots and remote backups of btrfs subvolumes"
arch=(any)
url="https://digint.ch/btrbk/"
license=(GPL3)
depends=(btrfs-progs perl)
makedepends=(asciidoctor git)
optdepends=(
  'bash: for contrib scripts'
  'mbuffer: for rate limiting and progress bars'
  'openssh: for transfering backups to/from remote hosts'
  'python: for contrib scripts'
  'sudo: for btrfs-progs-sudo backend'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/digint/btrbk.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C $pkgname
}

package() {
  make -C $pkgname DESTDIR="$pkgdir/" install
}
