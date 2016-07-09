# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python-pocketsphinx-git
pkgver=r68.24ab446
pkgrel=1
pkgdesc='Python interface to CMU SphinxBase and PocketSphinx libraries'
arch=('i686' 'x86_64')
url='https://github.com/bambocher/pocketsphinx-python'
license=('BSD')
depends=('python' 'swig')
makedepends=('git')
source=('python-pocketsphinx::git+https://github.com/cmusphinx/pocketsphinx-python.git')
sha256sums=('SKIP')
_gitname='python-pocketsphinx'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  
  # Should I do a status before init?
  git submodule init
  git submodule update
}

build() {
  cd "${srcdir}/${_gitname}"

  python setup.py build
}
package() {
  cd "${srcdir}/${_gitname}"

  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 ft=sh noet:
