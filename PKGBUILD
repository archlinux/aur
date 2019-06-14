# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('d39c11331fd3a4765ca421b4c6a1b5c4afba80d7367209c741317485219c725af3c140d28fa02d1285af0062cbd85e273301f765255013bac2770bef3503cb84')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 arch/register_app.py
}
