# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=whipper-plugin-eaclogger
pkgver=0.5.0
pkgrel=1
pkgdesc="Logger plugin for whipper that carefully mimics EAC's generated ones"
arch=(x86_64)
url="https://github.com/whipper-team/whipper-plugin-eaclogger"
license=('ISC')
depends=(whipper)
makedepends=(python-setuptools-scm)
source=("${url}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('87c09a971efccec2d4172a4745dab14eca24acd49786711cbe7c859fd3761cf94ea6e59f500bdf108a63aad5af94cc13f50a0d4238adfcc11c695c656f7a8900')

build() {
  cd ${pkgname}-${pkgver}
  echo "Version: ${pkgver}" > PKG-INFO
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="build/lib.linux-${CARCH}-${python_version}/" python -m unittest discover
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
