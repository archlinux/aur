# Maintainer: Ben Buhse <dotboy at firstnamelastname dot com>

_name=dotboy

pkgname="python-${_name}-git"
provides=()
conflicts=()
pkgver=r13.2a58166
pkgrel=1
pkgdesc='A Python script to help with dot file management'
arch=('any')
url="https://gitlab.com/bwbuhse/${_name}"
license=('MIT')
source=("git+${url}")
makedepends=('git' 'python' 'python-setuptools')
depends=(
  'python>=3.8'
  'python-setuptools'
  )
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

