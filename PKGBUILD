# Maintainer: Tim Culverhouse <tim at timculverhouse dot com>
#
# The Release workflow publishes this to the AUR for every release, filling in
# pkgver and the checksums from the release's tarballs.

pkgname=rush-shell-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='POSIX-facing shell with modern interactive features'
arch=(x86_64 aarch64)
url='https://rush.horse'
license=(MIT)
provides=("rush-shell=$pkgver")
conflicts=(rush rush-shell)
install=rush-shell.install
# Install the release binary as it was published.
options=(!strip !debug)
source_x86_64=("https://github.com/rockorager/rush/releases/download/v$pkgver/rush-$pkgver-x86_64-linux.tar.xz")
source_aarch64=("https://github.com/rockorager/rush/releases/download/v$pkgver/rush-$pkgver-aarch64-linux.tar.xz")
sha256sums_x86_64=(34e1d6376573d085f609e4c82d5e5644400dc57869bda21e004289c58364582f)
sha256sums_aarch64=(52e294e03f90b6008fc5bf07710af73eff106d7e3654fe15a4cffcc065e21026)

# The tarballs hold a static binary built for a /usr prefix, with its data
# under share/.
package() {
    cd "rush-$pkgver-$CARCH-linux"
    install -d "$pkgdir/usr"
    cp -a bin share "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
