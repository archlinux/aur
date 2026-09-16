# Maintainer: 9M2PJU <9m2pju@gmail.com>

pkgname=canon-pixma-g3010-tools-git
_pkgname=9M2PJU-Canon-PIXMA-G3010-Linux-Tool
pkgver=1.0.0.r5.ge1bbe80
pkgrel=1
pkgdesc="Linux driver setup, network routing fix, and maintenance assistant suite for Canon PIXMA G3010"
arch=('any')
url="https://github.com/9M2PJU/9M2PJU-Canon-PIXMA-G3010-Linux-Tool"
license=('GPL-3.0-or-later')
depends=(
  'bash'
  'cups'
  'cups-filters'
  'gutenprint'
  'foomatic-db-gutenprint-ppds'
  'avahi'
  'python'
)
optdepends=(
  'cnijfilter2-g3010: official Canon proprietary Linux driver'
  'networkmanager: for automatic persistent link-local IPv4 routing'
  'kitty: terminal emulator used in default desktop launcher'
)
makedepends=('git')
provides=('canon-pixma-g3010-tools' 'canon-g3010-maintenance')
conflicts=('canon-pixma-g3010-tools' 'canon-g3010-maintenance')
source=("git+https://github.com/9M2PJU/9M2PJU-Canon-PIXMA-G3010-Linux-Tool.git")
sha256sums=('SKIP')
install=canon-pixma-g3010-tools-git.install

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  # Install binary executable
  install -Dm755 "bin/canon-g3010-maintenance" "$pkgdir/usr/bin/canon-g3010-maintenance"

  # Install desktop application launcher
  install -Dm644 "desktop/canon-g3010-maintenance.desktop" "$pkgdir/usr/share/applications/canon-g3010-maintenance.desktop"

  # Install CUPS maintenance command payload files
  install -dm755 "$pkgdir/usr/share/cmdtocanonij2"
  install -Dm644 data/cmdtocanonij2/*.utl "$pkgdir/usr/share/cmdtocanonij2/"

  # Install Documentation & License
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
