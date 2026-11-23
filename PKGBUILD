# Maintainer: fanchao <ferryapp at fanchao dot dev>
#
# Repackages the release's .deb for Arch Linux. The release workflow fills in
# the @...@ fields (see pkgbuild.sh), attaches the result to the release and
# pushes it to the AUR as ferry-app-bin.

pkgname=ferry-app-bin
pkgver=1.16.1
pkgrel=1
pkgdesc='Pair with your devices and share files and the clipboard over the local network'
arch=(x86_64 aarch64)
url='https://github.com/cloudwalkerlabs/ferryapp'
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
_tag=v1.16.1
_release=$url/releases/download/$_tag
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/cloudwalkerlabs/ferryapp/$_tag/LICENSE")
source_x86_64=("$_release/ferry_1.16.1_amd64.deb")
source_aarch64=("$_release/ferry_1.16.1_arm64.deb")
sha256sums=('fa6cf94caa0ccb536b5313e9a851e53aba503d3ccfe4dd124b8e927cbd5d3eeb')
sha256sums_x86_64=('64cdc6a28f4815c72519ce1b4d491d421d60c17760146669e1a3696828c23ad4')
sha256sums_aarch64=('028a21de733e4fb1e77d9d93c50c9a89d00174b0f91c0db459239224b431f50d')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
