# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.27.1
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
sha256sums=('e440f4fb37af7eca802203550e27affca2ac84cc95461a7e059fb252195a90bd')
sha256sums_x86_64=('1dd161b5a9cf2391e10f9419e271f671b3ab7c32844429111b74971eeedce85e')
sha256sums_aarch64=('e170dac6b92d246a9f3f320849e85969906991d2380d972e7253158ebc4bf6d9')

package() {
  install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/jam"
  install -Dm644 jam-terms.html "$pkgdir/usr/share/licenses/$pkgname/TERMS.html"
}
