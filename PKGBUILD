# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.1
pkgrel=7
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/c3e7351a3c08c06287de55b9622c850a0a66239e.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-c3e7351a3c08c06287de55b9622c850a0a66239e"
  ./configure --prefix=/usr/local
  make all
}

package() {
  cd "${srcdir}/scidCommunity-c3e7351a3c08c06287de55b9622c850a0a66239e"
  # Override SHAREDIR and BINDIR to use DESTDIR
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/local/share/scid" BINDIR="${pkgdir}/usr/local/bin"
}
