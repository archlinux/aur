# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='filenote-git'
_pkgname="${pkgname%-git}"
pkgver=r52.f9b9c6a
pkgrel=1
pkgdesc='Attach a comment to a file or directory (development version)'
arch=('any')
url='https://codeberg.org/kas/filenote'
license=('GPL-3.0-or-later')  # SPDX-License-Identifier: GPL-3.0-or-later
depends=('python>=3.8')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit 1

  # See https://wiki.archlinux.org/title/VCS_package_guidelines
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname" || exit 1

  make "DESTDIR=$pkgdir" "PREFIX=/usr" install

  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# eof
