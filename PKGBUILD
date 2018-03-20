# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>
_pkgname=CairoSVG
pkgname=python2-cairosvg
pkgver=2.1.3
pkgrel=1
pkgdesc="Convert your SVG files to PDF and PNG."
arch=('any')
url="http://cairosvg.org"
license=('GPL')
depends=('python2' 'python2-cairocffi' 'python2-cffi' 'python2-pycparser')
makedepends=('git')
optdepends=('python2-lxml')
conflicts=()
source=("https://github.com/Kozea/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('71a576e0e0fa43fbce678e13053e2c02')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i 's/import re/import re\nimport io/' setup.py
  sed -i 's/open/\io.open/' setup.py
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
