# Maintainer: Jendrik <rua at jendrik dot eu>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=con2fbmap
pkgver=2.1.0
pkgrel=53
pkgdesc='Shows and sets mapping between consoles and framebuffer devices'
url='https://sources.debian.org/src/fbset/2.1-32/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=('https://mirrors.kernel.org/debian/pool/main/f/fbset/fbset_2.1-32.debian.tar.xz')
sha512sums=('e8a19b0b362640545c9b6642f29fdf7790af60d0b0c4dfe4b4218956dd8debc95fbb35e6dea18787e424f91b8606f29c1e50e82b247bcaab9609e2c0be078c06')

prepare() {
  cd "${srcdir}" || exit 1
  patch -N --silent -i debian/patches/03_con2fbmap.patch
}

build() {
  cd "${srcdir}" || exit 1
  gcc con2fbmap.c -o con2fbmap
}

package() {
  cd "${srcdir}" || exit 1
  install -Dm755 con2fbmap "${pkgdir}/usr/bin/con2fbmap"
  install -Dm755 -t "${pkgdir}/usr/share/man/man1" con2fbmap.1
}
