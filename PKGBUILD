# Maintainer: thegala <thegala@disroot.org>

_pkgname=bleachbit
pkgname=bleachbit-py3-git
pkgver=r4914.13ee23b7
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. Python 3 version.'
url='https://www.bleachbit.org/'
license=('GPL3')
source=("${_pkgname}::git+https://github.com/bleachbit/bleachbit.git")
sha256sums=('SKIP')
arch=('any')
depends=('pygtk' 'python-gobject' 'gtk3')
makedepends=('git')
conflicts=('bleachbit')
provides=('bleachbit')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git checkout origin/py3
  patch bleachbit.py < ../../python3-patch.patch
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  make prefix=/usr DESTDIR="$pkgdir" install
}
