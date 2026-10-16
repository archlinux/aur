# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# mahoragaos is free and open source. Development and hosting are funded
# entirely by donations — every contribution goes directly to keeping the
# project running.
# Donate (hosted, one-tap): https://www.buymeacoffee.com/bingusfan360
# Bank transfer / card / PayPal / crypto: https://mediaserver.tail5cfbf6.ts.net/
#
# NOTE (BIN-949 / MOSS naming v1): the AUR package name stays `mahoragaos`
# for this release. The upstream app is now `moss`; the wheel still ships a
# deprecated `mahoragaos` console shim for one release. Renaming this AUR
# package to `moss` is a Tier-3 board gate and is tracked separately.
pkgname=mahoragaos
pkgver=0.7.1
pkgrel=1
pkgdesc="An agentic backend that *will* be the best. Free and open source, funded by donations: https://www.buymeacoffee.com/bingusfan360 · https://mediaserver.tail5cfbf6.ts.net/"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.7.1/MahoragaOS-v0.7.1.tar.gz"
        "moss.svg"
        "moss.fish")
sha256sums=('1103d602fd7c57509954c16015a7bfe485028a95a4da5a9e62f85b534ddb9694'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.7.1
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.7.1
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
