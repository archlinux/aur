# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=PcbDraw
pkgname=pcbdraw
pkgver=1.1.1
pkgrel=1
pkgdesc="Convert your KiCAD board into a nicely looking 2D drawing suitable for pinout diagrams"
arch=('any')
url="https://github.com/yaqwsx/$_pkgname"
license=('MIT')
depends=('python3' 'kicad' 'python-numpy' 'python-lxml' 'python-mistune' 'python-pybars3' 'python-yaml' 'python-svgpathtools' 'python-pcbnewtransition' 'python-pyvirtualdisplay' 'python-pillow' 'python-click' 'python-wxpython')
#depends=('inkscape')
makedepends=('python-setuptools' 'python-wheel' 'python-pytest')
options=('!strip' '!emptydirs')
provides=('pcbdraw')
conflicts=('pcbdraw')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('384ff0e3fb402bb543da5d653ce895cc7c72b2358eaac34dc507aeb91ad4295bcbc20eea82b34a26db470c4a184f28abaf44a787427ca85926bf7053637d64a1')

prepare() {
  cd $_pkgname-$pkgver

  sed -e '/"versioneer"/d' -i setup.py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set ts=2 sw=2 et:
