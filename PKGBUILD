# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=nautilus-compare
pkgver=0.0.4
pkgrel=1
pkgdesc='Simple context menu file comparison extension for Nautilus 3 and above.'
arch=('i686' 'x86_64')
url="http://launchpad.net/nautilus-compare/"
license=('GPL3')
depends=('python2' 'nautilus>=3' 'python2-nautilus>=1' 'python2-xdg')
optdepends=('meld' 'kdiff3' 'diffuse' 'kdeskdk-kompare' 'fldiff' 'tkdiff')
install="$pkgname.install"
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
        $pkgname.patch)
sha256sums=('b01e2e11483682f1b604b2cc74d0668b84c8d12b0f32704e43b907dc2c5fb6f3'
            '97efe2d56c1cfe9a3134ab0f38f17da216d3c9addf45489f5bca5501a211f36c')

prepare() {
  cd "$srcdir"/"$pkgname-$pkgver"
  patch -p0 -i "$srcdir/$pkgname.patch"
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"

  mkdir "$pkgdir"/usr
  mkdir "$pkgdir"/usr{/bin,/share,/share/applications,/share/nautilus-python,/share/nautilus-python/extensions}

  chmod +x src/nautilus-compare.py
  chmod +x src/nautilus-compare-preferences.py
  cp -r src "$pkgdir"/usr/share/nautilus-compare

  ln -s ../../nautilus-compare/nautilus-compare.py "$pkgdir"/usr/share/nautilus-python/extensions/nautilus-compare.py
  ln -s ../share/nautilus-compare/nautilus-compare-preferences.py "$pkgdir"/usr/bin/nautilus-compare-preferences

  cp data/nautilus-compare-preferences.desktop "$pkgdir"/usr/share/applications/
}
