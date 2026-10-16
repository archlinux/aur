# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.28.0
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
# The terms page is unversioned upstream and changes over time. $pkgver in its name
# keeps a build host's persistent SRCDEST from serving a copy saved for an older
# release, which then fails the new checksum.
source=("jam-terms-$pkgver.html::https://jam.dev/legal/terms")
# Per-arch sources need DISTINCT output filenames. A shared name makes makepkg
# (and updpkgsums, which runs `makepkg -g`) fetch only the first, then reuse that
# file for the second arch — silently copying the x86_64 hash into
# sha256sums_aarch64. Literal arch suffixes (not $CARCH, which expands to the host
# arch for both arrays during checksum generation) keep the two downloads separate.
source_x86_64=("$pkgname-$pkgver-x86_64::https://native.jam.dev/download/linux/x64?version=$pkgver")
source_aarch64=("$pkgname-$pkgver-aarch64::https://native.jam.dev/download/linux/arm64?version=$pkgver")
sha256sums=('21caa0b3ebbf268502e44b7efffd83ff50f852dfae2d48a89e396f21df45445b')
sha256sums_x86_64=('57adc3a6773b32819d9518ff1744276ea62b044ac2d2adaa3cc3e8f8ff7b1137')
sha256sums_aarch64=('57a73e08f8fad4196dbb394dcf3b6473740dd00b8d4f5bbc5bbbbfa29b894b3f')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/jam"
  install -Dm644 "jam-terms-$pkgver.html" "$pkgdir/usr/share/licenses/$pkgname/TERMS.html"
}
