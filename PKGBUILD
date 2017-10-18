# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=librxvm
_ver=1.0.3
_pkgver=${_ver}
pkgver=${_ver}
pkgrel=1
pkgdesc='Non-backtracking NFA-based regular expression library, for C and Python'
arch=('i686' 'x86_64')
url='https://github.com/eriknyquist/librxvm'
depends=('pkgconfig')
options=('!buildflags')
makedepends=('gcc')
license=('Apache 2.0')
# https://github.com/eriknyquist/librxvm/archive/1.0.3.tar.gz
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('4fc5bce9db472e44127746a7dab646ca60a8b128e308e86f29fe02fa5f431fa4')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
