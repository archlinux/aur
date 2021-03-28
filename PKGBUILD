# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-torrentmirror-git
_pkgname=torrentmirror
pkgver=r13.e60f677
pkgrel=1
pkgdesc="Torrentmirror python library and CLI access"
arch=(any)
url='https://github.com/XayOn/torrentmirror'
license=('custom:none')
depends=('python' 'python-robobrowser' 'python-cleo' 'python-docopt' 'python-tabulate' 'python-xdg' 'python-pygogo')
checkdepends=('yapf')
makedepends=('python-setuptools' 'git' 'python-dephell')
provides=('torrentmirror')
conflicts=('torrentmirror')
source=("${_pkgname}::git://github.com/XayOn/torrentmirror")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  dephell deps convert --from pyproject.toml --to setup.py
}

build(){
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
