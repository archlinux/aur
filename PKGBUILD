# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libmill
pkgver=1.12
pkgrel=1
pkgdesc='Go-style concurrency in C'
arch=('i686' 'x86_64')
url='http://libmill.org/'
depends=('pkgconfig')
options=('!buildflags')
makedepends=('gcc')
license=('MIT')
source=("https://github.com/sustrik/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4983009fb930620147d999e47b3126b1eeb574c4ca9d8c38688f6c52f91d1e76')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
