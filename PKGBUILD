# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.20.1
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
sha256sums=('093c3941f1a01954b4632b9c187742df4be0812a8f867f5eb10ddd90a0b4442a')
sha256sums_x86_64=('a433c952bcee00b6582f2b8c874abe436bebc987f67409f030333cb32809a8b2')
sha256sums_aarch64=('83b05746badd91f17adac3718da5befff9ac31d5d3f99e8317edf06a63fd51f0')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/jam"
  install -Dm644 jam-terms.html "$pkgdir/usr/share/licenses/$pkgname/TERMS.html"
}
