# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('rednukem-git')
pkgver=Betav6.r12.g20dbaa8
pkgrel=1
pkgdesc='Redneck Rampage and Duke Nukem 3D port based on EDuke32'
arch=('i686' 'x86_64')
url='https://github.com/nukeykt/NRedneck'
license=('GPL' 'custom: BUILD')
depends=('sdl2_mixer' 'libgl' 'libvpx' 'flac' 'gtk2')
makedepends=('mesa' 'glu')
makedepends_i686=('nasm')
install='rednukem.install'
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/NRedneck"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/NRedneck"
  msg2 'Building rednukem ...'
  # add cxxflags, set revision
  make PACKAGE_REPOSITORY=1 #PRETTY_OUTPUT=0
}

package() {
  cd "${srcdir}/NRedneck"
  # install binaries, buildlicense, icon and desktop files
  msg2 'Installing rednukem ...'
  install -d "${pkgdir}/usr/bin"
  install -m 755 rednukem "${pkgdir}/usr/bin/"
  install -Dm 644 "package/common/buildlic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/buildlic.txt"
  install -Dm 644 "../../rednukem.png" "${pkgdir}/usr/share/pixmaps/rednukem.png"
  install -Dm 644 "../../rednukem.desktop" "${pkgdir}/usr/share/applications/rednukem.desktop"
}
# vim:set ts=2 sw=2 et: