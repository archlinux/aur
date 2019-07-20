# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=remarshal
pkgver=0.11.2
pkgrel=1
pkgdesc="Convert between TOML, YAML and JSON"
arch=('any')
url="https://github.com/dbohdan/remarshal"
license=('MIT')
depends=('python-dateutil' 'python-pytoml' 'python-yaml' 'python-u-msgpack')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/dbohdan/remarshal/archive/v${pkgver}.tar.gz")
sha256sums=('3f383e48f59722a4d93ef2b5e417b6a8c152f382a1faad416099ffcde5c87a66')

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
