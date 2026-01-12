# Maintainer: LinuxLover471 <LinuxLover471 at proton dot me>
# Contributor: melchips <truphemus dot francois at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Olivier Duclos <olivier dot duclos at gmail dot com>

_pkgname=xcompmgr
pkgname=${_pkgname}-git
pkgver=1.1.10.r3.g76c12c6
pkgrel=2
pkgdesc="Composite window effect manager for X.org (git)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext' 'libxfixes' 'libx11' 'glibc')
makedepends=('git' 'xorg-util-macros')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+https://gitlab.freedesktop.org/xorg/app/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/xcompmgr\.//'
}

prepare() {
  cd ${_pkgname}
  autoreconf -fiv
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/${license}"
}
