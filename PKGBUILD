pkgbase=skwd-wall-v2
pkgname=(skwd-wall-v2 skwd-deck skwd-paper skwd-lens)
pkgver=1.0.0_beta.25
pkgrel=1
pkgdesc='Native Skwd wallpaper suite v2 packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall/tree/v2'
license=(GPL-3.0-or-later)
makedepends=(
  cargo clang gcc lld pkgconf curl nasm patchelf
  alsa-lib dav1d libdrm libglvnd libpulse libva libxkbcommon libyuv zlib
  shaderc vulkan-headers vulkan-icd-loader wayland wayland-protocols
)
options=(!debug !lto)
source=("skwd-suite-1.0.0-beta.25.tar.xz::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.25/skwd-suite-1.0.0-beta.25.tar.xz")
sha256sums=('25fd356875c67716b1b7e1883b60fbf95e3bcaebf59974f4c9b38506a056d820')



build() {
  cd "skwd-suite-1.0.0-beta.25"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  export SKWD_USE_LLD=1
  ./distribution/build.sh all
}

package_skwd-wall-v2() {
  pkgdesc='GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(gcc-libs libxkbcommon skwd-deck skwd-paper vulkan-icd-loader wayland)
  optdepends=(
    'skwd-lens: semantic wallpaper search'
    'skwd-paper-plasma: KDE Plasma wallpaper integration'
  )
  cd "skwd-suite-1.0.0-beta.25"
  ./distribution/install.sh wall "$pkgdir"
}

package_skwd-deck() {
  pkgdesc='Control daemon and tools for the Skwd wallpaper suite v2'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper)
  optdepends=(
    'skwd-deck-steamworks: Steam Client Workshop backend'
    'skwd-lens: semantic wallpaper search'
    'steamcmd: alternative Steam Workshop backend'
  )
  cd "skwd-suite-1.0.0-beta.25"
  ./distribution/install.sh deck "$pkgdir"
}

package_skwd-paper() {
  pkgdesc='Still, video, and Wallpaper Engine renderers for Skwd v2'
  depends=(alsa-lib dav1d gcc-libs libdrm libglvnd libpulse libva libxkbcommon libyuv shaderc vulkan-icd-loader wayland zlib)
  cd "skwd-suite-1.0.0-beta.25"
  ./distribution/install.sh paper "$pkgdir"
}

package_skwd-lens() {
  pkgdesc='Optional semantic wallpaper search engine for Skwd v2'
  depends=(gcc-libs skwd-lens-model)
  cd "skwd-suite-1.0.0-beta.25"
  ./distribution/install.sh lens "$pkgdir"
}
