# Maintainer: Elijah Lynn <elijah@elijahlynn.net>
pkgname=ultraworking-headquarters-bin
pkgver=0.27.1
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
sha512sums=('658712bb067139ee71f38d4526f43ff2e03e600e14e59faed34c1f38b384115c6eea24ebf357ae6c1c3f18fec696a686ca935ac22d97e2cf165f1e41f467f113')

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
