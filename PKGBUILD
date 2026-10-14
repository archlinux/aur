# Maintainer: Joydev GmbH (https://joydev.com)
#
# Template, not a finished PKGBUILD: `just publish-aur <version>` fills the
# @...@ fields from the published release, test-builds it and pushes the
# result with its .SRCINFO.
#
# Repacks the release archive jyn-cli-<target>.tar.xz: the jyn binary.
# The -bin suffix is the AUR
# rule for prebuilt binaries; provides makes `yay -S jyn` find it while no
# package of that name exists.

pkgname=joyint-jyn-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Jyn, a personal task manager: Git-native, CLI-first, CalDAV-ready'
arch=('x86_64' 'aarch64')
url='https://joyint.com/jyn'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('jyn')
conflicts=('jyn')
options=('!strip' '!debug')
source_x86_64=("jyn-cli-x86_64-0.9.0.tar.xz::https://github.com/joyint/jyn/releases/download/v0.9.0/jyn-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("jyn-cli-aarch64-0.9.0.tar.xz::https://github.com/joyint/jyn/releases/download/v0.9.0/jyn-cli-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('41cf112ac933e7febbd8f497095380f9fcc585db312d9940f6d1681daab3a78b')
sha256sums_aarch64=('ba1e945bc5b391a18449c70a5d1e2a1a3fdbf4b74368ace8b01560d2e350a5ab')

package() {
  cd "jyn-cli-${CARCH}-unknown-linux-gnu"
  install -Dm755 jyn "$pkgdir/usr/bin/jyn"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
