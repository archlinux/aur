# Maintainer: David Raznick <david.raznick@globalenergymonitor.org>
#
# Prebuilt-binary package, repackaging the GitHub release artifacts.
# After each release: bump pkgver, reset pkgrel, run `updpkgsums`.
pkgname=sqlnow-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Local SQL viewer for files and databases, with pre-defined queries for LLM-agent workflows"
arch=('x86_64' 'aarch64')
url="https://github.com/kindly/sqlnow"
# a prebuilt binary is taken as it was released: stripping it here would
# rewrite a file whose checksum was just verified, and the release is already
# stripped, so the split debug package was empty anyway
options=('!strip' '!debug')
license=('MIT')
provides=('sqlnow')
conflicts=('sqlnow')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sqlnow-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sqlnow-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('310f5af3edc27b8e8515d75904d2ad03ba10b2cc2d9b8adafaa1e8c270f4ee84')
sha256sums_aarch64=('dbda7add324501c73ed9d7a219861888e841050576a29770ee3a27ac84ead032')

package() {
    install -Dm755 sqlnow "$pkgdir/usr/bin/sqlnow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sqlnow/README.md"
    install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/sqlnow/AGENTS.md"
}
