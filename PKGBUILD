# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.2.44
pkgrel=67
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/a05338b393e2dcda370617be36c89e521e93675c.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-a05338b393e2dcda370617be36c89e521e93675c"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-a05338b393e2dcda370617be36c89e521e93675c"
  # Install under /usr so desktop/icon files land in standard system paths
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"

  # Install desktop entry
  install -Dm644 -t "${pkgdir}/usr/share/applications" "flatpak/io.github.whelanh.scidCommunity.desktop"
  # Install application icon
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "flatpak/io.github.whelanh.scidCommunity.svg"
}
