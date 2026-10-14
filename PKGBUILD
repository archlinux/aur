# Maintainer: Joydev GmbH (https://joydev.com)
#
# Template, not a finished PKGBUILD: `just publish-aur <version>` fills the
# @...@ fields from the published release, test-builds it and pushes the
# result with its .SRCINFO.
#
# Repacks the release archive joy-cli-<target>.tar.xz: joy, the forge
# connector joy-forge beside it, and the pinned ssh host keys, which joy
# reads from <prefix>/share/joy/host-keys.json. The -bin suffix is the AUR
# rule for prebuilt binaries. The AUR package `joy`, a programming language,
# installs a /usr/bin/joy of its own: the two conflict, and this package
# does not claim to provide `joy`.

pkgname=joyint-joy-bin
pkgver=0.23.1
pkgrel=1
pkgdesc='Joy, product management that lives in your Git repository (CLI)'
arch=('x86_64' 'aarch64')
url='https://joyint.com/joy'
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('joy')
options=('!strip' '!debug')
source_x86_64=("joy-cli-x86_64-0.23.1.tar.xz::https://github.com/joyint/joy/releases/download/v0.23.1/joy-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("joy-cli-aarch64-0.23.1.tar.xz::https://github.com/joyint/joy/releases/download/v0.23.1/joy-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1c214b001c10acbd6a32736472df88814b206361c4bcd8d00c35ed653ef59ea4')
sha256sums_aarch64=('b5404843a0238c6c8b4dc1053aff015e705d1a741e06ecc80f12cc5670a6701b')

package() {
  cd "joy-cli-${CARCH}-unknown-linux-gnu"
  install -Dm755 joy "$pkgdir/usr/bin/joy"
  install -Dm755 joy-forge "$pkgdir/usr/bin/joy-forge"
  install -Dm644 host-keys.json "$pkgdir/usr/share/joy/host-keys.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
