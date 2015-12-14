# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_pkgname=libmill
pkgname=lib32-${_pkgname}
pkgver=1.3
pkgrel=1
pkgdesc='Go-style concurrency in C'
arch=('x86_64')
url='http://libmill.org/'
depends=('lib32-glibc' 'pkgconfig' ${_pkgname})
options=('!buildflags')
makedepends=('gcc-multilib')
license=('MIT')
source=("https://github.com/sustrik/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a081c9c31fa9dea834bab7b62f900745b5c7d182418669265adb8d4897622a9f')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  make -C "${srcdir}/${_pkgname}-${pkgver}" check
}

package() {
  make -C "${srcdir}/${_pkgname}-${pkgver}/" DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/include"
}

# vim:set ft=sh ts=2 sw=2 et:
