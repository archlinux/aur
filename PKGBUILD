pkgname=gottengeography
pkgver=2.5
pkgrel=3
pkgdesc='Automagically geotag photos with GPX data.'
arch=('any')
url='https://launchpad.net/gottengeography'
license=('GPL3')
depends=('python' 'python-gobject' 'python-dateutil' 'libchamplain>=0.12.2' 'libgexiv2' 'desktop-file-utils' 'hicolor-icon-theme' 'dconf')
makedepends=('python-distutils-extra')
install="$pkgname.install"
source=(https://git.launchpad.net/gottengeography/snapshot/gottengeography-dd98beb826da62f430d51749dfa340af3620053c.tar.gz
        fixes.patch)
sha256sums=('510e6cb9d2e5ca5f103d8b5c0203a4d6e7f886cf5213aff907d99bd3f726b000'
            '963901c05cda50265205b714c414a76d4f9723d62073afe702b6827ec075ed8b')

package() {
  local dirname=$(tar tf "$srcdir/$pkgname-dd98beb826da62f430d51749dfa340af3620053c.tar.gz" | sed 1q);
  cd "$srcdir/$dirname"
  patch -p1 < "$srcdir/fixes.patch"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
