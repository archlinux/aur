# Maintainer: Ben Buhse <dotboy at firstnamelastname dot com>

_name=dotboy

pkgname="python-${_name}-git"
provides=("python-${_name}")
conflicts=("python-${_name}")
pkgver=v0.3.0.r0.f5443e9
pkgrel=1
pkgdesc='A Python script to help with dot file management'
arch=('any')
url="https://gitlab.com/bwbuhse/${_name}"
license=('MIT')
source=("git+${url}")
makedepends=('git' 'python-setuptools')
depends=(
    'python>=3.8'
    'python-gitpython')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  # Change into the source git directory
  cd "${srcdir}/${_name}"

  # Run python setup function
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Install the licence
  install -Dm644 "${srcdir}/${_name}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}

