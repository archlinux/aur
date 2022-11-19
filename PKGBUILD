# Maintainer: Mario Rubio <mario at mrrb dot eu>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=PcbDraw
pkgname=pcbdraw
pkgver=1.0.1
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
sha512sums=('023b62c68b7ad91b1d0d3134775ba7c645a523a5724b8a188665178ddb5071746a15e5bdc565aeed5737d0031a093ddc8a5bea09b74f2fcc4d25582026d6eff6')

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
