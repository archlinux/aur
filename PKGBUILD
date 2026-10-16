# Maintainer: skint007 <archlinux.repose742@passmail.net>
#
# The command-line client from a GitHub Release, the bundle CI built and
# tested (docs/releasing.md). The release workflow sets the maintainer's
# email, _version, pkgrel and the checksum when it publishes this to the AUR.
# The first release with the CLI's archive is 0.6.0, so this copy has no
# checksum yet.

# pacman sorts a prerelease such as 0.3.0rc.1 before 0.3.0 only without the `-`.
_version=0.6.0
pkgname=wikistow-cli-bin
pkgver=${_version//-/}
pkgrel=1
pkgdesc="Command-line client for your family's encrypted wiki, for people and their agents"
# One JavaScript file, run on the system Node.
arch=('any')
url="https://github.com/skint007/wikistow"
license=('MIT')
# The bundle targets Node 26.
depends=('nodejs>=26')
optdepends=("libsecret: keep an agent's key in the keyring (agent enroll --secret-store)")
provides=('wikistow-cli')
conflicts=('wikistow-cli')
source=("https://github.com/skint007/wikistow/releases/download/v$_version/wikistow-cli-$_version.tar.gz")
sha256sums=('821f45f9a8472ecdfa1771fba88a6abe3b4cb904369b59fba99a7bb098223f4c')

package() {
    cd "wikistow-cli-$_version"
    install -Dm644 wikistow.mjs "$pkgdir/usr/lib/wikistow-cli/wikistow.mjs"
    install -Dm755 wikistow "$pkgdir/usr/bin/wikistow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
