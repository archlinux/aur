# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>

pkgname=remarshal
pkgver=0.12.0
pkgrel=1
pkgdesc="Convert between TOML, YAML and JSON"
arch=('any')
url="https://github.com/dbohdan/remarshal"
license=('MIT')
depends=('python-dateutil' 'python-pytoml' 'python-yaml' 'python-u-msgpack' 'python-setuptools')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dbohdan/remarshal/archive/v${pkgver}.tar.gz")
sha256sums=('39d46501894fd9e8a8af3126ea99d988967aff25209a30ac038ec37fcf522983')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
