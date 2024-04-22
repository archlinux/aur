# Maintainer: Peter Mattern <pmattern@arcor.de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=lxqt-openssh-askpass
pkgname=${_pkgname}-git
pkgver=2.0.0
pkgrel=1
pkgdesc='LXQt openssh password prompt'
arch=('i686' 'x86_64')
url="https://lxqt.github.io"
license=("LGPL-2.1-only")
depends=('liblxqt-git')
makedepends=('git' 'cmake' 'qt6-tools' 'lxqt-build-tools-git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/lxqt/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  mkdir -p build
  cd build
  cmake "${srcdir}/${_pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
