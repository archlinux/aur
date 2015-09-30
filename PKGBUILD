# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ipython-yf-git
_gitname=ipython-yf
pkgver=r10.dd488d0
pkgrel=2
pkgdesc="An ipython extension to make it asyncio compatible"
arch=('any')
url="https://github.com/tecki/ipython-yf/"
license=('BSD')
depends=('ipython')
source=("git://github.com/tecki/${_gitname}.git"
        'pyqt5.patch')
md5sums=('SKIP'
         '2aa5425630f0182db1d76bdf67625b59')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}"
  patch -Np1 -i "${srcdir}/pyqt5.patch"
}

package() {
  cd "${_gitname}"
  python_path="$(python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())')"
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"
  install -D -m 0644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
  install -D -m 0644 printfuture.py "${pkgdir}${python_path}/printfuture.py"
  install -D -m 0644 yf.py "${pkgdir}${python_path}/yf.py"
}

# vim:set ts=2 sw=2 et:
