# Maintainer: KillerOp007 <79337152+KillerOp007@users.noreply.github.com>
#
# Repackages the release .deb (same binary as every other platform).
#
# This is deliberately the LAST step of a release and lags the tree on
# purpose: the checksums below are of published release assets, so bumping
# pkgver before those assets exist produces a new version carrying old hashes,
# which is worse than an obviously stale file. scripts/preflight.sh fails
# while this lags, which is the reminder. See docs/RELEASING.md step 10.
#
#   updpkgsums && makepkg --printsrcinfo > .SRCINFO

pkgname=rhythr-bin
pkgver=0.6.1
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
sha256sums=('de7c0f6b3134dda0bbc0d52c8ceaa1a109dac561dee780f44965b9ccd92f02a5'
            '74f100c0e5ed1b3e3dd697ebb21c868526375dd03e9a1dd93c2e2609c1444bdc')

package() {
  bsdtar -xOf "rhythr_${pkgver}_amd64.deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
