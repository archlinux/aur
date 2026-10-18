# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# mahoragaos is free and open source. Development and hosting are funded
# entirely by donations — every contribution goes directly to keeping the
# project running.
# Donate (hosted, one-tap): https://www.buymeacoffee.com/bingusfan360
#
# NOTE (BIN-949 / MOSS naming v1): the AUR package name stays `mahoragaos`
# for this release. The upstream app is now `moss`; the wheel still ships a
# deprecated `mahoragaos` console shim for one release. Renaming this AUR
# package to `moss` is a Tier-3 board gate and is tracked separately.
pkgname=mahoragaos
pkgver=0.7.2
pkgrel=2
pkgdesc="An agentic backend that *will* be the best. Free and open source, funded by donations: https://www.buymeacoffee.com/bingusfan360"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'hicolor-icon-theme')
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

  # Install icon (the app is `moss`; the package name lags one release)
  install -Dm644 "$srcdir/moss.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/moss.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install man page (from source tarball)
  install -Dm644 "docs/man/moss.1" "$pkgdir/usr/share/man/man1/moss.1"

  # Install fish completion (from source repo)
  install -Dm644 "$srcdir/moss.fish" "$pkgdir/usr/share/fish/completions/moss.fish"
}
