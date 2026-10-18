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
pkgver=0.24.0
pkgrel=1
pkgdesc='Joy, product management that lives in your Git repository (CLI)'
arch=('x86_64' 'aarch64')
url='https://joyint.com/joy'
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('joy')
options=('!strip' '!debug')
source_x86_64=("joy-cli-x86_64-0.24.0.tar.xz::https://github.com/joyint/joy/releases/download/v0.24.0/joy-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("joy-cli-aarch64-0.24.0.tar.xz::https://github.com/joyint/joy/releases/download/v0.24.0/joy-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('b7d5ab78008929f3a09bb7fa82619a66fdf861cbc998920e4a9933ee255adef6')
sha256sums_aarch64=('e66c8592216c807f69490c65e3cd2706ac3e5d6f1b1db468304e94c84dc52c0c')

package() {
  cd "joy-cli-${CARCH}-unknown-linux-gnu"
  install -Dm755 joy "$pkgdir/usr/bin/joy"
  install -Dm755 joy-forge "$pkgdir/usr/bin/joy-forge"
  install -Dm644 host-keys.json "$pkgdir/usr/share/joy/host-keys.json"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
