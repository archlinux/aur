# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.2.0
pkgrel=1
pkgdesc="GUI for Flatpak applications management"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('070a9bb38c078f63f4a4dc9ce7992e0dcd8717bf8d025512d19dc9d25a8b14b77a90d8fc9c6ccf08b0120a106164edfb4cf6f1099600d72ca2d5bf01a4249ade')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 arch/register_app.py
}
