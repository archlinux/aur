# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Gour <gour@gour-nitai.com>
pkgname=bibstuff
pkgver=1.3.1
pkgrel=1
epoch=1
pkgdesc="Bibtex database utilities"
url="https://github.com/dschwilk/bibstuff"
arch=(any)
license=(MIT)
depends=(python-simpleparse)
makedepends=(python-build python-installer python-setuptools python-wheel git)
source=(git+${url}.git#commit=bc12fcd62f181f870b185ef9080fe1c386bed6f5)
md5sums=('c0b2391f18f9bfde7a6018033348abe6')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd $pkgname
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "$pkgdir"/usr/share/doc/$pkgname/examples
  cp examples/* "$pkgdir"/usr/share/doc/$pkgname/examples
}