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
sha512sums=('7f0c3d4af0fe2ea519c85f06ba2b41b9215bb94551e94886649fc6fea67d383265e3678fe116a3bbbb89ef9a2cf31b6ab951ca68c2cd4b72d34772973706d156')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 arch/register_app.py
}
