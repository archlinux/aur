# Maintainer: KillerOp007 <79337152+KillerOp007@users.noreply.github.com>
#
# Repackages the release .deb (same binary as every other platform).
# Before pushing to the AUR: bump pkgver, then refresh sha256sums with
# `updpkgsums` (or makepkg -g) against the published release assets.

pkgname=rhythr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Unofficial community tool that renders Rhythia (.rhr) replays into pixel-accurate videos"
arch=('x86_64')
url="https://github.com/KillerOp007/rhythr"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'ffmpeg' 'openssl' 'vulkan-icd-loader' 'hicolor-icon-theme')
provides=('rhythr')
conflicts=('rhythr')
options=('!strip')
source=(
  "$url/releases/download/v$pkgver/rhythr_${pkgver}_amd64.deb"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/KillerOp007/rhythr/v$pkgver/LICENSE"
)
noextract=("rhythr_${pkgver}_amd64.deb")
sha256sums=('218a747d53f1ed7e039d6840aa0973e4cafa6c8a5b76e27117945b4a0c66c3e3'
            '74f100c0e5ed1b3e3dd697ebb21c868526375dd03e9a1dd93c2e2609c1444bdc')

package() {
  bsdtar -xOf "rhythr_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
