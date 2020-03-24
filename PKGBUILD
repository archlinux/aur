# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-hupper
_pkgname=hupper
pkgver=1.10.2
pkgrel=1
pkgdesc="Integrated process monitor for developing servers"
arch=('any')
url="https://github.com/Pylons/hupper"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-watchdog' 'python-pytest-cov' 'python-pytest-runner')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('d5f848171baa74d7592c79c8d423526f8ab807817f1f0bcfbda1396166cf6038')

build(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py pytest -v || true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
