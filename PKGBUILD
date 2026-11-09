# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.35.0
pkgrel=1
pkgdesc="CLI for reading and creating Jam bug reports (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://jam.dev/docs/cli"
license=('LicenseRef-Jam-Terms')
depends=('glibc')
optdepends=('xdg-utils: browser-based authentication')
provides=('jam-cli')
conflicts=('jam' 'jam-cli')
options=('!debug' '!strip')
# LICENSE points at the Jam Terms of Service rather than a downloaded copy: the
# terms page is unversioned and Jam revises it, so a pinned checksum breaks the
# build on each revision.
source=('LICENSE')
# Per-arch sources need DISTINCT output filenames. A shared name makes makepkg
# (and updpkgsums, which runs `makepkg -g`) fetch only the first, then reuse that
# file for the second arch — silently copying the x86_64 hash into
# sha256sums_aarch64. Literal arch suffixes (not $CARCH, which expands to the host
# arch for both arrays during checksum generation) keep the two downloads separate.
source_x86_64=("$pkgname-$pkgver-x86_64::https://native.jam.dev/download/linux/x64?version=$pkgver")
source_aarch64=("$pkgname-$pkgver-aarch64::https://native.jam.dev/download/linux/arm64?version=$pkgver")
sha256sums=('e43a27568e11ed5a4f72ab661e3380e8a3366e023a7296874a71211ccc4a5af8')
sha256sums_x86_64=('eb495cd9f7f9035bf3eb5dfa499274080bb25c36129eb3ee73711439e1291647')
sha256sums_aarch64=('ffe2538cac01f8c4e2fe74184f85cb0d87109ce46ba2e47a2e480becd0e7e08b')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/jam"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
