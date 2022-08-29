# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.8
pkgrel=2
arch=(any)
url="https://github.com/ismet55555/${pkgname}"
license=('Apache')
depends=(python-fpdf2 python-requests python-pyaml python-click)
makedepends=(python-setuptools python-pip)
provides=(${pkgname})
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz
  https://raw.githubusercontent.com/ismet55555/${pkgname}/master/requirements.txt)
sha512sums=('7678e05d01c6f556c4f05e0ce4ec58b6bd158f9469fa67a90464af274db4c6102bc55d2683208152e7144486e49c540a41cbfc96876af5a6046fdddd066e0c8a' '5ff9f0127ca598b6f48db00c260a617124deb77831d66d591e2f73bd81760f377385f437c141da2860e62880357781d3d03bb32a687b86984e5066c281c7b5dd')

prepare() {
  mv requirements.txt ${pkgname}-${pkgver}
}

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
