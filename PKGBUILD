# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Matthew Stobbs <matthew@stobbstechnical.com>

_pkgname=lxqt-admin
pkgname=${_pkgname}-git
pkgver=2.0.0
pkgrel=1
pkgdesc='LXQt system administration'
arch=('i686' 'x86_64' 'armv6h')
url="https://lxqt.github.io"
license=("LGPL-2.1-only")
depends=('liblxqt-git')
optdepends=('lxqt-policykit-git: polkit authentication agent provided by LXQt')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/${_pkgname}"
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
