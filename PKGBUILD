# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Salvador Pardiñas <darkfm@vera.com.uy>

pkgname=higan-git
pkgver=107.r0.g3a12e1c5
pkgrel=1
pkgdesc="Nintendo multi-system emulator by Byuu"
arch=(x86_64 i686)
url="https://higan.byuu.org/"
license=(GPL3)
depends=(libpulse gtksourceview2 sdl2 libxv libao libgl openal)
makedepends=(git mesa)
provides=(higan)
conflicts=(higan)
source=("git+https://github.com/byuu/higan")
sha256sums=('SKIP')

pkgver() {
  cd higan
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd higan
  make -C higan target=higan
  make -C icarus
}

package() {
  cd higan

  install -Dm 755 higan/out/higan -t "${pkgdir}"/usr/bin/
  install -Dm 644 higan/target-higan/resource/higan.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 higan/target-higan/resource/higan.png -t "${pkgdir}"/usr/share/pixmaps/
  cp -dr --no-preserve='ownership' higan/System "${pkgdir}"/usr/share/higan

  install -Dm 755 icarus/out/icarus -t "${pkgdir}"/usr/bin/
  install -Dm 644 icarus/data/icarus.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 icarus/data/icarus.png -t "${pkgdir}"/usr/share/pixmaps/
  install -dm 755 "${pkgdir}"/usr/share/icarus
  cp -dr --no-preserve='ownership' icarus/Database "${pkgdir}"/usr/share/icarus/
}
