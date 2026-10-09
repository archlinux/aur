# Maintainer: Bingusfan360 <bingusfan360@proton.me>
#
# mahoragaos is free and open source. Development and hosting are funded
# entirely by donations — every contribution goes directly to keeping the
# project running.
# Donate (hosted, one-tap): https://www.buymeacoffee.com/bingusfan360
# Bank transfer / card / PayPal / crypto: https://mediaserver.tail5cfbf6.ts.net/
pkgname=mahoragaos
pkgver=0.7.0
pkgrel=1
pkgdesc="An agentic backend that *will* be the best. Free and open source, funded by donations: https://www.buymeacoffee.com/bingusfan360 · https://mediaserver.tail5cfbf6.ts.net/"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.7.0/MahoragaOS-v0.7.0.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg"
        "mahoragaos.fish")
sha256sums=('3e2d3bfa7bda6c8736372c42cee7c2ef5a33dcdb3b090c178aeb561d45480505'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.7.0
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.7.0
  /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file
  install -Dm644 "$srcdir/mahoragaos.desktop" "$pkgdir/usr/share/applications/mahoragaos.desktop"

  # Install icon
  install -Dm644 "$srcdir/mahoragaos.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mahoragaos.svg"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install man pages (from source tarball)
  install -Dm644 "docs/man/mahoragaos.1" "$pkgdir/usr/share/man/man1/mahoragaos.1"
  install -Dm644 "docs/man/mahoragaos-ui.1" "$pkgdir/usr/share/man/man1/mahoragaos-ui.1"

  # Install fish completion (from source repo)
  install -Dm644 "$srcdir/mahoragaos.fish" "$pkgdir/usr/share/fish/completions/mahoragaos.fish"
}