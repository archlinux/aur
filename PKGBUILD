# Contributor: Spyros Stathopoulos <spystath@gmail.com>
pkgname=python-labjackpython-git
_gitname="LabJackPython"
pkgver=533.1ccdd45
pkgrel=1
pkgdesc="Python module for communicating with LabJack devices"
arch=('any')
url="http://labjack.com/support/labjackpython"
license=('MIT')
depends=('python' 'labjack-exodriver')
conflicts=('python-labjackpython')
provides=('python-labjackpython')
makedepends=('git')
source=("${_gitname}::git+https://github.com/labjack/LabJackPython")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p ${pkgdir}/usr/share/doc/labjackpython
  python setup.py install --prefix=/usr --root="${pkgdir}"
  cp -dpr --no-preserve=ownership \
    Examples ${pkgdir}/usr/share/doc/labjackpython
}
# vim:ts=2:sw=2:et
