# Maintainer: Snowstorm64

pkgname=ares-emu
pkgver=142
pkgrel=1
pkgdesc="Cross-platform, open source, multi-system emulator by Near and Ares team, focusing on accuracy and preservation."
arch=("x86_64" "i686" "aarch64")
url="https://ares-emu.net/"
license=("ISC")
depends=("alsa-lib" "gcc-libs" "libao" "libgl" "libpulse" "librashader>=0.5.1-1"
  "libretro-shaders" "libudev.so=1-64" "libx11" "libxrandr" "openal" "sdl2"
  "vulkan-driver" "vulkan-icd-loader" "zlib" "cairo" "gdk-pixbuf2" "glib2"
  "glibc" "gtk3" "hicolor-icon-theme" "pango")
makedepends=("cmake" "mesa" "ninja" "pkgconf")
provides=("ares-emu")
conflicts=("ares-emu")
install="ares.install"
source=("https://github.com/ares-emulator/ares/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("14d1a1b789c51ba51f26a12b4ddadffd448228a1054d6bbae98fc3af7581cb159ce555887d3be3f321b86b1e17fe9c9fabab58570d1a1cdb30bb27fd0520143b")

build() {
  local cmake_options=(
    -B "build"
    -S "ares-${pkgver}"
    -W no-dev
    -D CMAKE_BUILD_TYPE="None"
    -D CMAKE_INSTALL_PREFIX="/usr"
    -D ARES_BUILD_LOCAL=OFF
    -D ARES_BUNDLE_SHADERS=OFF
    -D ARES_SKIP_DEPS=ON
    -G Ninja
    )
  cmake "${cmake_options[@]}"
  cmake --build "build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "build"
  install -Dm 644 "ares-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
