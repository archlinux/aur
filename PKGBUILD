# Maintainer: nanw <nanw at example dot com>

pkgname=caveman
pkgver=1.9.1
pkgrel=1
pkgdesc="Make your AI coding agent talk like a caveman. Same answers, 65% fewer output tokens."
arch=('any')
url="https://github.com/JuliusBrussee/caveman"
license=('MIT')
depends=('nodejs>=18')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JuliusBrussee/caveman/archive/v$pkgver.tar.gz")
sha256sums=('94017e661f434f4a71e6c0210f261a0f327546b3d96f7be8bdd40c16951e74c3')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install complete source tree so bin/install.js can resolve its
  # local dependencies (bin/lib/, src/hooks/, skills/, agents/, etc.)
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r bin src skills agents plugins commands \
    "$pkgdir/usr/share/$pkgname/"
  install -m644 package.json README.md LICENSE \
    "$pkgdir/usr/share/$pkgname/"

  # Symlink into PATH
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/bin/install.js" "$pkgdir/usr/bin/$pkgname"

  # License for the packaged software
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
