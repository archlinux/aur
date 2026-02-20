# Maintainer: asyync1024 <asyync1024 at proton dot me>
# Contributor: melchips <truphemus dot francois at gmail dot com>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Olivier Duclos <olivier dot duclos at gmail dot com>

_reponame=xcompmgr
pkgname=${_reponame}-git
pkgver=1.1.10.r3.g76c12c6
pkgrel=5
pkgdesc="Composite window effect manager for X.org (git)"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('MIT')
depends=('libxcomposite' 'libxdamage' 'libxrender' 'libxext' 'libxfixes' 'libx11' 'glibc')
makedepends=('git' 'xorg-util-macros')
provides=("${_reponame}")
conflicts=("${_reponame}")
source=("git+https://gitlab.freedesktop.org/xorg/app/${_reponame}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/xcompmgr\.//'
}

prepare() {
  cd "${_reponame}"
  autoreconf -fiv
}

build() {
  cd "${_reponame}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_reponame}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
