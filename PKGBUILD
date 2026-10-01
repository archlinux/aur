# Maintainer: fanchao <ferryapp at fanchao dot dev>
#
# Repackages the release's .deb for Arch Linux. The release workflow fills in
# the @...@ fields (see pkgbuild.sh), attaches the result to the release and
# pushes it to the AUR as ferry-app-bin.

pkgname=ferry-app-bin
pkgver=1.13.0
pkgrel=1
pkgdesc='Pair with your devices and share files and the clipboard over the local network'
arch=(x86_64 aarch64)
url='https://github.com/simophin/ferryapp'
license=(MIT)
# The .deb's Depends under Arch's names: glibc and libgcc from the ELF files,
# and the libraries winit and display-info load at runtime. The app draws in
# software, so it needs no GPU driver.
depends=(
  glibc gcc-libs hicolor-icon-theme fontconfig ttf-font
  libxcb libxkbcommon libxkbcommon-x11 wayland libx11 libxcursor libxi libxrandr
)
optdepends=(
  'xdg-desktop-portal: file pickers'
  'noto-fonts-cjk: Chinese, Japanese and Korean text'
)
provides=(ferry)
conflicts=(ferry)
# Ship the binaries exactly as they are in the .deb.
options=(!strip !debug)
_tag=v1.13.0
_release=$url/releases/download/$_tag
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/simophin/ferryapp/$_tag/LICENSE")
source_x86_64=("$_release/ferry_1.13.0_amd64.deb")
source_aarch64=("$_release/ferry_1.13.0_arm64.deb")
sha256sums=('fa6cf94caa0ccb536b5313e9a851e53aba503d3ccfe4dd124b8e927cbd5d3eeb')
sha256sums_x86_64=('15ec671efe7d86a0c8f11f6fd321e5616b6865bd7d6daf0cba3d0d2f6e7747be')
sha256sums_aarch64=('7d2aca54294bd3184555cf28ad7cfa7f838a2ed9957dbb611f1f41117e09d648')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
