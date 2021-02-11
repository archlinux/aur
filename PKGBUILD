# Maintainer: Batuhan Baserdem <lastname dot firstname at gmail>

_name=maestral-qt

pkgname="${_name}-git"
provides=("${_name}")
conflicts=("${_name}")
pkgver=1.3.2.dev0.r0.gddb1dd5
pkgrel=1
pkgdesc='A Qt interface for the Maestral daemon'
arch=('any')
url="https://github.com/SamSchott/${_name}"
license=('MIT')
source=("git+${url}#branch=develop")
makedepends=('git' 'python' 'python-setuptools' 'python-wheel')
depends=(
    'python'
    'maestral'
    'python-click>=7.1.1'
    'python-markdown2'
    'python-packaging'
    'python-pyqt5>=5.9')
optdepends=('gnome-shell-extension-appindicator: Gnome integration')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's|\([^-]*-g\)|r\1|;s|-|.|g;s|^v||g'
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
  install -Dm644 "${srcdir}/${_name}/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
