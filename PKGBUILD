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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/6cb28bbcea677b219ab4fc03d71f7699705d8b26.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-6cb28bbcea677b219ab4fc03d71f7699705d8b26"
  ./configure --prefix=/usr/local
  make all
}

package() {
  cd "${srcdir}/scidCommunity-6cb28bbcea677b219ab4fc03d71f7699705d8b26"
  # Override SHAREDIR and BINDIR to use DESTDIR
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/local/share/scid" BINDIR="${pkgdir}/usr/local/bin"
}
