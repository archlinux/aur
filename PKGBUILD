# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=exam-terminal
pkgdesc="Terminal/console based exam, test, or quiz tool for educators and learners"
pkgver=0.2.6
pkgrel=1
arch=('x86_64')
url="https://github.com/ismet55555/${pkgname}"
license=('Apache')
depends=(python-fpdf2 python-requests python-pyaml python-click)
makedepends=(python-pip)
provides=(${pkgname})
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz https://raw.githubusercontent.com/ismet55555/${pkgname}/master/requirements.txt https://raw.githubusercontent.com/ismet55555/${pkgname}/master/LICENSE)
sha512sums=('623aec6660935f02aeebfb04bb94441f27f1ad699f50d3b38d9dcfc67434b6fc1d9aee8b7dd9b6c57e55501dce7b341824fe341ed762bb8743c7c2b32754b639' '5ff9f0127ca598b6f48db00c260a617124deb77831d66d591e2f73bd81760f377385f437c141da2860e62880357781d3d03bb32a687b86984e5066c281c7b5dd' '2ac7c39a2614da0bccf327103181fda84637655cc7cc378146dbe397f662a8df91d7995ca83317759a099685a9fe5bc4b06e35327561088a5eef4d6121530015')

export PYTHONPYCACHEPREFIX="${BUILDDIR}/${pkgname}/.cache/cpython/"

prepare() {
  mv requirements.txt "${pkgname}-${pkgver}"
  mv LICENSE "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
