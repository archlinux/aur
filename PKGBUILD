# Maintainer: skint007 <archlinux.repose742@passmail.net>
#
# The command-line client from a GitHub Release: the binary CI built for
# this architecture from the bundle it tested (docs/releasing.md). The
# release workflow sets the maintainer's email, _version, pkgrel and the
# checksums when it publishes this to the AUR. The binaries start with the
# release after 0.12.0, so this copy's version and checksums are only where
# publishing starts.

# pacman sorts a prerelease such as 0.3.0rc.1 before 0.3.0 only without the `-`.
_version=0.17.0
pkgname=wikistow-cli-bin
pkgver=${_version//-/}
pkgrel=1
pkgdesc="Command-line client for your family's encrypted wiki, for people and their agents"
arch=('x86_64' 'aarch64')
url="https://github.com/skint007/wikistow"
license=('MIT')
# Bun's runtime is inside the binary; it links only glibc.
depends=('glibc')
optdepends=("libsecret: keep an agent's key in the keyring (agent enroll --secret-store)")
provides=('wikistow-cli')
conflicts=('wikistow-cli')
# Stripping would cut off the program Bun appends to its runtime.
options=('!strip' '!debug')
_download="https://github.com/skint007/wikistow/releases/download/v$_version"
source=("LICENSE-$_version::$_download/LICENSE")
source_x86_64=("wikistow-$_version-x86_64::$_download/wikistow-linux-x64")
source_aarch64=("wikistow-$_version-aarch64::$_download/wikistow-linux-arm64")
sha256sums=('49e9b16003c5e96891265ca2f912087102de955704eda32482dfe2c4b8fbafd6')
sha256sums_x86_64=('ee30dcfc634a3ca8766a8d0849d0e6073c06f88203c4fbe586993d8492372d9c')
sha256sums_aarch64=('4f48f353e074c7dc4c9251146d7482e183a3a377c5a55d009576544e3476218b')

package() {
    install -Dm755 "wikistow-$_version-$CARCH" "$pkgdir/usr/bin/wikistow"
    install -Dm644 "LICENSE-$_version" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
