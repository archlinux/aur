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
sha512sums=('aa90ee6635c617c2cf48ee9932c242c9855f53c13415793ccbc3dd0eb111e3e777ef19bf923f3a1389e369ac5e1ecf1a4bdfd2c549c3535c6aa17fb691976427')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 arch/register_app.py
}
