# Maintainer: Wilson Simanjuntak <wilsontulus5@gmail.com>
_pkgname=kvm-serial
pkgname=python-kvm-serial-git
pkgver=1.5.6.r7.g277619b
pkgrel=1
pkgdesc="Python Serial KVM Controller for CH9329 and CH9350L - git version"
arch=('any')
url="https://github.com/sjmf/${_pkgname}"
license=('MIT')
depends=('python-pyserial' 'python-pyusb' 'python-pynput' 'python-screeninfo' 'python-pyqt5' 'python-toml' 'qt5-multimedia')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
provides=('python-kvm-serial')
conflicts=('python-kvm-serial')
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
