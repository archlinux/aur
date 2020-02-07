# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>
# Arch Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: linkmauve <linkmauve@linkmauve.fr>
# Contributor: mokkurkalve <xenofil@gmail.com>

pkgname=libkate-git
pkgver=0.4.1
pkgrel=6
pkgdesc="A karaoke and text codec for embedding in ogg. Without broken KateDJ and Python2."
url="https://wiki.xiph.org/OggKate"
license=('BSD')
arch=('x86_64')
depends=('libpng' 'libogg')
conflicts=('libkate')
replaces=('libkate')
provides=('libkate='${pkgver})
makedepends=('pkg-config' 'git')
source=("$pkgname::git+https://gitlab.com/lubosz/kate.git#branch=no-katedj")
sha512sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr \
              --disable-static \
              --disable-doc
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
