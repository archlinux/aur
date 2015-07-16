# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=laditools-git
pkgver=1.0.r9.g498fc36
pkgrel=6
pkgdesc="Utilities to improve integration and workflow with JACK and LASH."
arch=('any')
url="https://launchpad.net/laditools"
license=('GPL3')
depends=('jack' 'python2' 'pygtk' 'python2-yaml' 'glade' 'python2-enum')
makedepends=('git' 'python2-distutils-extra')
provides=('laditools')
conflicts=('laditools')
install=${pkgname}.install
source=("${pkgname}::git://repo.or.cz/laditools.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
}

build() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}/"
}
