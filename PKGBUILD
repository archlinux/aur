# Maintainer: Ordoe ordoe <aur@cach.co>

pkgname=python-rtimulib-git
_gitname=RTIMULib
pkgver=121.b949681
pkgrel=1
pkgdesc="Python Binding for RTIMULib, a versatile IMU library."
arch=('armv7h')
url="http://www.richards-tech.com/"
license=('BSD')
depends=('python' 'python-setuptools')
makedepends=('gcc')
provides=('python-rtimulib')
source=("git+https://github.com/RPI-Distro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${_gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
  cd "${srcdir}/${_gitname}/Linux/python/"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}/Linux/python/"
  python setup.py install --root="${pkgdir}" --optimize=1
  
  # Install license
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
