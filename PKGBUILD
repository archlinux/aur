# Maintainer: Rodrigo Rivas Costa <rodrigorivascosta at gmail dot com>
pkgname=papercraft
pkgver=2.1
pkgrel=1
pkgdesc="A tool to unwrap 3D paper models"
arch=('i686' 'x86_64')
url="http://github.com/rodrigorc/papercraft"
license=('GPL3')
depends=('cairo' 'bzip2' 'shared-mime-info')
makedepends=('git' 'rust')
_commit=v$pkgver
source=("${pkgname}::git+https://github.com/rodrigorc/papercraft.git#commit=$_commit")
sha512sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  git submodule update --init
  cargo build --release
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 target/release/papercraft ${pkgdir}/usr/bin/papercraft
  install -Dm644 src/papercraft.png ${pkgdir}/usr/share/icons/hicolor/192x192/apps/papercraft.png
  install -Dm644 distro/papercraft.desktop ${pkgdir}/usr/share/applications/papercraft.desktop
  install -Dm644 distro/papercraft.xml ${pkgdir}/usr/share/mime/packages/papercraft.xml
}
