# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python38-cairosvg
_pkgname=CairoSVG
pkgver=2.5.2
pkgrel=4
pkgdesc='SVG converter based on Cairo. It can export SVG files to PDF, PostScript and PNG files'
arch=('any')
url='https://cairosvg.org'
license=('LGPL3')
depends=('python38-cairocffi' 'python38-cssselect2' 'python38-defusedxml' 'python38-pillow' 'python38-tinycss2')
makedepends=('python38-setuptools' 'python38-pytest-runner')
checkdepends=('python38-pytest')
replaces=('cairosvg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kozea/CairoSVG/archive/$pkgver.tar.gz")
sha512sums=('a2e397bd0847baa87de76c7b3c1db56924634ba0c3510e91dafc4ab4f74850b7cd54683298d315dc1ff644f9b674ba20e03d7b3a17575a9d7e7c0c432845b05e')

prepare() {
  cd $_pkgname-$pkgver
  sed -i -e '/pytest-runner/d' -e '/--flake8/d' -e '/--isort/d' setup.cfg

  cp -r cairosvg test_non_regression/cairosvg_reference/
}

build() {
  cd $_pkgname-$pkgver

  python38 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
