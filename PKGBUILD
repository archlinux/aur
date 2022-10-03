# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=PcbDraw
pkgname=pcbdraw
pkgver=0.6.1
pkgrel=3
pkgdesc='Convert your KiCAD board into a nice looking 2D drawing suitable for pinout diagrams'
arch=('any')
url='https://github.com/yaqwsx/PcbDraw'
license=('MIT')
depends=('python' 'kicad' 'python-numpy' 'python-lxml' 'python-mistune1' 'python-pybars3' 'python-wand' 'python-yaml')
makedepends=('python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('bf149f030eb2b66bc7d4fcd3c93b8775dcd5ed49975a8f648c445f72496ba970704bcbe588975efe0607cbff6ebce41382aac0ac484f87eff853c4b5cfec9bcd')


prepare() {
  cd $_pkgname-$pkgver
  sed -e '/"versioneer"/d' -i setup.py
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
