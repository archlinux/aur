# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
_pkgname=laditools
pkgname=${_pkgname}-git
pkgver=1.0.r9.g498fc36
pkgrel=1
pkgdesc="Utilities to improve integration and workflow with JACK and 
LASH."
arch=('any')
url="https://launchpad.net/laditools"
license=('GPL3')
depends=('pygtk' 'python2-yaml' 'glade')
makedepends=('git' 'python2' 'python2-distutils-extra')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${pkgname}.install
source=("git://repo.or.cz/${_pkgname}.git")
md5sums=('SKIP')

_branch=master

pkgver() {
  cd ${srcdir}/${_pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git checkout ${_branch}
}

build() {
  cd "${srcdir}/${_pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
