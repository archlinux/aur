# Maintainer: KillerOp007 <79337152+KillerOp007@users.noreply.github.com>
#
# Repackages the release .deb (same binary as every other platform).
# Before pushing to the AUR: bump pkgver, then refresh sha256sums with
# `updpkgsums` (or makepkg -g) against the published release assets.

pkgname=rhythr-bin
pkgver=0.3.0
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
sha256sums=('f932022eb897259a074e5e46d2c62ca4203db6e8730fa10cb00735124dc7244d'
            '74f100c0e5ed1b3e3dd697ebb21c868526375dd03e9a1dd93c2e2609c1444bdc')

package() {
  bsdtar -xOf "rhythr_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
