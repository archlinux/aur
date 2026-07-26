# Maintainer: David Raznick <david.raznick@globalenergymonitor.org>
#
# Prebuilt-binary package, repackaging the GitHub release artifacts.
# After each release: bump pkgver, reset pkgrel, run `updpkgsums`.
pkgname=sqlnow-bin
pkgver=0.4.1
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
sha256sums_x86_64=('fcca99da3dee067cadedeca5b45d24ba5913b0b7a45a4377eceaed482fdcc749')
sha256sums_aarch64=('feb30c7d5d583fe0a304b0048c45f4714277680cfd791b1ebfb173f565bdbb4c')

package() {
    install -Dm755 sqlnow "$pkgdir/usr/bin/sqlnow"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sqlnow/README.md"
    install -Dm644 AGENTS.md "$pkgdir/usr/share/doc/sqlnow/AGENTS.md"
}
