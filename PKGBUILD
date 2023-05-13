# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.2.3
pkgrel=2
pkgdesc="Binary diff and patch using the BSDIFF4-format"
arch=('x86_64')
url="https://github.com/ilanschnell/${pkgname##*-}"
license=('BSD')
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('266d2f0ef1dfd97370e80f272eb0818a8f0c3cbecb15c07069242bedb15e1c3d019b36910a33afa364945a4b0993113a4ea02e22f63ab109b196d364ea7dbf0e')

build() {
  cd "${pkgname##*-}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname##*-}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

