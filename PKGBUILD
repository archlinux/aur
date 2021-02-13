# Maintainer: Elijah Lynn <elijah@elijahlynn.net>
pkgname=ultraworking-headquarters-bin
pkgver=0.19.2
pkgrel=1
pkgdesc="Ultraworking Headquarters app"
arch=('x86_64')
url="https://www.ultraworking.com"
# TODO depends()
depends=()
optdepends=()
license=('custom')
makedepends=('curl')
options=('!strip' '!emptydirs')
# This file is download to the git root directory and symlinked to a relative ./src/ directory.
source=("https://github.com/Ultraworking/headquarters/releases/download/v${pkgver}/headquarters_${pkgver}_amd64.deb")
sha512sums=('a0a5afa74af7b2b14fccbe7a1507af9d873970ccef2c07383b1419020d5f2bfe2d9187095c66822784b961b82c6d7dc3d4df68e9918b2cd235b99469c4a3373b')

# pkgdir = /home/elijah/Projects/aur-ultraworking-headquarters-bin/pkg/ultraworking-headquarters-bin
# CWD = /home/elijah/Projects/aur-ultraworking-headquarters-bin/src

# This stage will show as "Starting package()..." when running "makepkg --install --syncdeps"
package(){
  mkdir --parents "${pkgdir}/opt/${pkgname}"
  # The curl download of the *.deb is copied to ./src/data/tar.xz for this operation.
  tar --extract --file data.tar.xz
  cp -r usr/lib/headquarters/* "${pkgdir}/opt/${pkgname}"
  install --directory --mode=755 "${pkgdir}"/usr/bin
  # This symlink is not actually created at root at this point, but is just pointed there so when it is installed it works.
  ln -s /opt/"$pkgname"/Headquarters "$pkgdir/usr/bin/headquarters"
  install -D --mode=644 "usr/share/applications/headquarters.desktop" "${pkgdir}/usr/share/applications/headquarters.desktop"
  install -D --mode=644 "usr/share/pixmaps/headquarters.png" "${pkgdir}/usr/share/pixmaps/headquarters.png"
}
