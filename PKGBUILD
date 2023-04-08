# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python-pyqrcode
_gitcommit=674a77b5eaf850d063f518bd90c243ee34ad6b5d
pkgver=1.2.1
pkgrel=6
pkgdesc='QR code generator written purely in Python with SVG, EPS, PNG and terminal output'
url='https://github.com/mnooner256/pyqrcode'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-nose' 'python-pypng')
optdepends=('python-pypng: PNG generation support')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/mnooner256/pyqrcode/archive/${_gitcommit}.tar.gz")
sha512sums=('87a307e57d470153b37cccd3e79c8e04fc8de63cc7ffce313a7cc7d7e7f53b2979125ac3680a4b261fe0eeffd476e7934fa189a679f9370d690113811cc750b8')
b2sums=('b192c55f3e6fb5c6d2c5f245d34fc909fbaaa582586a2a60526a98fb83079136358a0012d98e0772fb73eecb5133fecb643525fae05de8eede10b6f7a6662f08')

build() {
  cd "pyqrcode-${_gitcommit}"
  python -m build --wheel --no-isolation
}

check() {
  cd "pyqrcode-${_gitcommit}"
  nosetests -sv tests
}

package() {
  cd "pyqrcode-${_gitcommit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 License -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
