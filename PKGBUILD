# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=PcbDraw
pkgname=pcbdraw
pkgver=1.0.0
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

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('d736694e4eab200fe7c65e3e3b29a5ca7a825c8d43f55d89c7457f11d788f007cd7bcb345bb1d7a579df50edff58c093545266d180cebfce85722cea91c0782a')

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
