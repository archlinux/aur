# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# DEPRECATED package name. The `moss` name was adopted for the application
# (BIN-1711, after board/user direction changed); install `moss` instead.
# moss-os is kept only as a legacy alias during the transition. Both packages
# install the same files, so they conflict with each other. The installed
# command is `moss`; this package also replaces the AUR `mahoragaos` package
# (rename per the MOSS naming scheme, BIN-949).
#
# moss is free and open source. Development and hosting are funded
# entirely by donations — every contribution goes directly to keeping the
# project running.
# Donate (hosted, one-tap): https://www.buymeacoffee.com/bingusfan360
pkgname=moss-os
pkgver=0.7.2
pkgrel=2
pkgdesc="DEPRECATED: use the 'moss' package instead. Agentic backend funded by donations: https://www.buymeacoffee.com/bingusfan360"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'hicolor-icon-theme')
# AUR rename mahoragaos -> moss (Tier-3 gate, BIN-949/BIN-1711): the old
# package builds the same wheel, so it must be replaced, not co-installed.
replaces=('mahoragaos')
conflicts=('mahoragaos' 'moss')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.7.2/MahoragaOS-v0.7.2.tar.gz"
        "moss.svg"
        "moss.fish")
sha256sums=('2f54b2399d41857a566aa1f785a121a8a12c8624b3f5ff64112a19cc66a75a5c'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.7.2
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.7.2
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install icon
  install -Dm644 "$srcdir/moss.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/moss.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install man pages (from source tarball)
  install -Dm644 "docs/man/moss.1" "$pkgdir/usr/share/man/man1/moss.1"

  # Install fish completion (from source repo)
  install -Dm644 "$srcdir/moss.fish" "$pkgdir/usr/share/fish/completions/moss.fish"
}