# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=nautilus-compare
pkgver=0.0.5
pkgrel=2
pkgdesc='Simple context menu file comparison extension for Nautilus 3 and above.'
arch=('any')
url="http://launchpad.net/nautilus-compare/"
license=('GPL3')
depends=('python-nautilus' 'python-xdg')
makedepends=('python')
optdepends=('meld' 'kdiff3' 'diffuse' 'kompare' 'fldiff' 'tkdiff')
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('16b52d8814d4aa41590d57f5390c6c5de7ecd5d91da9a47d80d9403bcc29c7a4')

prepare() {
  cd "$pkgname-$pkgver"
  /usr/bin/2to3 -wn --no-diffs src
}

package() {
  cd "$pkgname-$pkgver"

  install -dm755 "$pkgdir"/usr{/bin,/share/nautilus-python/extensions}

  chmod +x src/nautilus-compare.py
  chmod +x src/nautilus-compare-preferences.py
  cp -r src "$pkgdir/usr/share/nautilus-compare"

  ln -s /usr/share/nautilus-compare/nautilus-compare.py "$pkgdir/usr/share/nautilus-python/extensions/nautilus-compare.py"
  ln -s /usr/share/nautilus-compare/nautilus-compare-preferences.py "$pkgdir/usr/bin/nautilus-compare-preferences"

  install -Dm644 data/nautilus-compare-preferences.desktop "$pkgdir/usr/share/applications/nautilus-compare-preferences.desktop"
}
