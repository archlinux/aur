# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-video-gliden64-highscore-git
pkgver=4.0.r730.g89617dd
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL-2.0-only')
depends=(
  'libglvnd'
  'mupen64plus-git'
)
makedepends=(
  'cmake'
  'git'
)
provides=('mupenplus-video-gliden64')
conflicts=('mupenplus-video-gliden64')
source=('git+https://github.com/gonetz/GLideN64.git')
sha256sums=('SKIP')

pkgver() {
  cd GLideN64
  git describe --long --tags --match "Public_Release*" --abbrev=7 | sed 's/^Public_Release_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -S GLideN64/src
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D USE_SYSTEM_LIBS='ON'
    -D MUPENPLUSAPI='ON'
    -D NO_OSD='ON'
    -D NOHQ='ON'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
