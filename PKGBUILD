# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.13.0
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
source=("jam-terms.html::https://jam.dev/legal/terms")
# Per-arch sources need DISTINCT output filenames. A shared name makes makepkg
# (and updpkgsums, which runs `makepkg -g`) fetch only the first, then reuse that
# file for the second arch — silently copying the x86_64 hash into
# sha256sums_aarch64. Literal arch suffixes (not $CARCH, which expands to the host
# arch for both arrays during checksum generation) keep the two downloads separate.
source_x86_64=("$pkgname-$pkgver-x86_64::https://native.jam.dev/download/linux/x64?version=$pkgver")
source_aarch64=("$pkgname-$pkgver-aarch64::https://native.jam.dev/download/linux/arm64?version=$pkgver")
sha256sums=('3653db64c7b32a2ba8fe73ea11bd1aeffa12aac706bf234cb202b129f088799b')
sha256sums_x86_64=('4cbda3d528480a678d5c0627bae327be87f292e67aab71afd88f48bfc7711465')
sha256sums_aarch64=('33703ec9cbdd2cde9b5f6debfd022515ba6ab48e8b7793db56a0f3f50232cb79')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/jam"
  install -Dm644 jam-terms.html "$pkgdir/usr/share/licenses/$pkgname/TERMS.html"
}
