# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.2.1
pkgrel=1
pkgdesc="GUI for Flatpak applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('GPL3')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('ec06da347c5e21d98b685b91174e526d900f0c72c2816449a4a08cc67e3855c754fb0c6d576c53370f6321085bf346fc9c62fde725b40f0a7507fb2732cbcf5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/register_app.py
}
