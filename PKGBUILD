# Maintainer: Andreas Björkman <akb95@disroot.org>
# Contributor: Eugene Lebedev <satanych13+dev@gmail.com>

pkgname=better-libretro-pcsx2-launcher-git
pkgver=r75.a1dd7e4
pkgrel=1
pkgdesc="Launch Sony PlayStation 2 games through PCSX2, directly from RetroArch. Updated to work with PCSX2 from this century and extended with extra functionality/robustness"
arch=('x86_64')
url="https://github.com/TheBeardOfTruth/better-libretro-pcsx2-launcher"
license=('MIT')
conflicts=('libretro-pcsx2-launcher')
provides=('libretro-pcsx2-launcher')
depends=('pcsx2' 'libretro-core-info')
makedepends=('git')
groups=('libretro')

source=("libretro-pcsx2::git+https://github.com/TheBeardOfTruth/better-libretro-pcsx2-launcher.git")

sha256sums=(SKIP)

pkgver() {
  cd libretro-pcsx2
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd libretro-pcsx2
  make
}

package() {
  install -Dm644 libretro-pcsx2/pcsx2_launcher_libretro.so "${pkgdir}/usr/lib/libretro/pcsx2_launcher_libretro.so"
  install -Dm644 libretro-pcsx2/pcsx2_launcher_libretro.info "${pkgdir}/usr/share/libretro/info/pcsx2_launcher_libretro.info"
  install -Dm644 libretro-pcsx2/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

