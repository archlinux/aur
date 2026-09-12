# Maintainer: zeozeozeo <killabites@duck.com>
# Upstream: https://github.com/zeozeozeo/teacrush
pkgname=teacrush-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Bubble Tea TUI for compressing videos down to a target size (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/zeozeozeo/teacrush'
license=('Unlicense')
depends=('ffmpeg' 'glibc')
provides=('teacrush')
conflicts=('teacrush' 'teacrush-git')
optdepends=(
  'nvidia-utils: NVENC hardware encoding'
  'intel-media-driver: Intel QSV hardware encoding'
  'libva-mesa-driver: AMD VA-API hardware encoding'
)
_tag="v$pkgver"
source=(
  "LICENSE-$_tag::https://raw.githubusercontent.com/zeozeozeo/teacrush/refs/tags/$_tag/LICENSE"
)
source_x86_64=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/zeozeozeo/teacrush/releases/download/$_tag/teacrush-$_tag-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-$CARCH.tar.gz::https://github.com/zeozeozeo/teacrush/releases/download/$_tag/teacrush-$_tag-linux-arm64.tar.gz")
# NOTE: CI (.github/workflows/aur.yml) refreshes pkgver and checksums on
# every stable release. After bumping locally, refresh with:
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('b5065838cbac452dfc855ba6e6e031481ad2c68406f70d21ead9321374653e6c')
sha256sums_x86_64=('085385ac6cf51b30dcd20f65315a1ff8b873369404d78ef24af24c7dc8246f62')
sha256sums_aarch64=('90ac4e1906f0c33370f2bc3170e9e7e6d4fabe15d759edc64ae6a53cf0f585f8')

package() {
  install -Dm755 teacrush "$pkgdir/usr/bin/teacrush"
  install -Dm644 "LICENSE-$_tag" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
