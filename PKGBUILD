# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

pkgname=afancontrol
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Advanced Fan Control program, which controls PWM fans according to the current temperatures of the system components."
arch=('any')
url="https://afancontrol.readthedocs.io/en/latest/"
license=('MIT')
depends=('python-click' 'lm_sensors')
makedepends=('python-setuptools')
optdepends=('hddtemp: for measuring HDD/SSD temperatures')
backup=("etc/$pkgname/$pkgname.conf")
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/KostyaEsmukov/${pkgname}/${pkgver}/LICENSE")
sha256sums=('3b35bd7256901efc5b55a41e56960384afe3dc58aff12b128533cabe323566d1'
            'cfbf3d258bc1990f8633f0751cf14515500938a6949ff413f6491dfe4b804d1a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
  mv "${pkgdir}/usr/etc/systemd" "${pkgdir}/usr/lib"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
