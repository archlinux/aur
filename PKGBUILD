# Maintainer: Bingusfan360 <bingusfan360@proton.me>
pkgname=mahoragaos
pkgver=0.6.3
pkgrel=1
pkgdesc="An agentic backend that *will* be the best"
arch=('any')
url="https://gitlab.com/Bingusfan360/MahoragaOS"
license=('AGPL-3.0-or-later')
depends=('python' 'pyside6' 'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$url/-/archive/v0.6.3/MahoragaOS-v0.6.3.tar.gz"
        "mahoragaos.desktop"
        "mahoragaos.svg"
        "mahoragaos.fish")
sha256sums=('4fd767195864a4cda2d28625ac0404105a737d1efe03f706155c0eb110b2339d'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd MahoragaOS-v0.6.3
  /usr/bin/python -m build --wheel
}

package() {
  cd MahoragaOS-v0.6.3
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