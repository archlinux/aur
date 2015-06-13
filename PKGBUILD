# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python2-labjackpython-git
_gitname="LabJackPython"
pkgver=417.d821117
pkgrel=1
pkgdesc="Python module for communicating with LabJack devices"
arch=('any')
url="http://labjack.com/support/labjackpython"
license=('MIT')
depends=('python2' 'labjack-exodriver')
conflicts=('python2-labjackpython')
provides=('python2-labjackpython')
makedepends=('git')
source=("${_gitname}::git+git://github.com/labjack/LabJackPython" 'LICENSE')
md5sums=('SKIP' '6b654d05134aa959b7db1f4b05c7f33d')

pkgver() {
  cd "${srcdir}"/"${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/${_gitname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p ${pkgdir}/usr/share/doc/labjackpython
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -D -m644 ../LICENSE \
    ${pkgdir}/usr/share/licenses/python2-labjackpython/LICENSE
  cp -dpr --no-preserve=ownership \
    Examples ${pkgdir}/usr/share/doc/labjackpython
}
# vim:ts=2:sw=2:et
