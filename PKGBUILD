# Maintainer: Will Price <will.price94@gmail.com>

pkgname=cadnano-git
_pkgname=${pkgname%%-git}
pkgver=r884.f4b84a4
pkgrel=1
pkgdesc="CAD for 3D DNA origami nanostructures"
arch=('any')
url="http://cadnano.org"
license=('BSD3')
depends=('python'
         'python-setuptools'
         'python-pip'
         'python-sip'
         'python-pyqt5'
         'python-numpy'
         'python-pandas'
         'python-pytz'
         'python-dateutil')
source=('cadnano::git+https://github.com/cadnano/cadnano2.5.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  sed -i 's/PyQt5>=5.8.2/PyQt5>=5.8/' setup.py
}

package() {
  mkdir -p "${pkgdir}"
  cd "${_pkgname}"
  python setup.py install \
    --root="$pkgdir" \
    --prefix=/usr \
    --optimize=1
}

# vim:set ts=2 sw=2 et:
