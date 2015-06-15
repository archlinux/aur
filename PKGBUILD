# Maintainer: Mikkel Oscar Lyderik <mikkeloscar at gmail dot com>

_py=python
_gitname=python

pkgname=${_py}-vlc-git
pkgver=r238.3a66100
pkgrel=1
pkgdesc="Python bindings for VLC"
arch=('any')
url="https://wiki.videolan.org/Python_bindings"
license=('GPLv2')
depends=(${_py} 'vlc')
makedepends=("${_py}-distribute")
source=("git://git.videolan.org/vlc/bindings/${_gitname}.git"
        'setup.py')
sha1sums=('SKIP'
          'd5aa28f55600795e71a9a28e0d633d20ad2cc0ee')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # use custom setup.py
  cp setup.py "${srcdir}/${_gitname}/"

  # move vlc.py to root
  cp "${srcdir}/${_gitname}/generated/vlc.py" "${srcdir}/${_gitname}/"
}

build() {
  cd "${srcdir}/${_gitname}"
  # build module
  ${_py} setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  ${_py} setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
