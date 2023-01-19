# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Michael Duell < mail at akurei dot me >
# Contributor: Daniel J. Campos <dcampos2015 at my dot fit dot edu>

pkgname=btrbk-git
pkgver=0.32.5.r28.ga75765c
pkgrel=1
pkgdesc="Backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations"
arch=('any')
url="https://digint.ch/btrbk/"
license=('GPL3')
depends=('btrfs-progs' 'perl')
makedepends=('asciidoctor' 'git')
optdepends=('mbuffer: send/receive buffering and rate limiting, progress bars'
            'openssh: transfer backups from/to remote locations'
            'sudo: btrfs-progs-sudo backend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/digint/btrbk.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  make -C $pkgname DESTDIR="$pkgdir/" install
}

