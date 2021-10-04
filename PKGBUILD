# Maintainer: Michael Duell < mail at akurei dot me >
# Contributor: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
pkgname=btrbk-git
pkgver=0.31.3.r67.g4234fb2
pkgrel=1
pkgdesc="A backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
provides=('btrbk')
depends=('perl' 'btrfs-progs')
makedepends=('asciidoctor' 'git')
options=('!makeflags') # temporary fix for https://github.com/digint/btrbk/pull/341
optdepends=('openssh: remote backup support',
        'mbuffer: --progress support and add buffering to send-stream')
source=("git+https://github.com/digint/btrbk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/btrbk"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "${srcdir}/btrbk"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/btrbk/COPYING"
}


