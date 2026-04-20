# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.3.22
pkgrel=1
pkgdesc="Very simple server for the Gemini hypertext protocol"
arch=(x86_64 aarch64 armv6h armv7h)
url="https://github.com/mbrubeck/agate"
license=(Apache-2.0 MIT)
depends=(glibc)

source=(
    agate@.service
    agate.conf
    agate.sysusers
    "https://raw.githubusercontent.com/mbrubeck/agate/refs/tags/v$pkgver/LICENSE-MIT"
)
_dl="$url/releases/download/v$pkgver"
source_x86_64=("agate-$pkgver-x86_64.gz::$_dl/agate.x86_64-unknown-linux-gnu.gz")
source_aarch64=("agate-$pkgver-aarch64.gz::$_dl/agate.aarch64-unknown-linux-gnu.gz")
source_armv6h=("agate-$pkgver-armv6h.gz::$_dl/agate.arm-unknown-linux-gnueabihf.gz")
source_armv7h=("agate-$pkgver-armv7h.gz::$_dl/agate.armv7-unknown-linux-gnueabihf.gz")

sha256sums=(
    "c74d88a5a449892a79221f6931989f60019dbcc9fcc8ecf57da34dca5778b80e"
    "7d044c20605bdd974775cdb1ae2229dbe9c86884f8a403f75818ac5bd37f567f"
    "8dc4041d1a673eeb87118385fbc60c74ee9422535251e16f64f5c76e8e7b72cf"
    "0b28172679e0009b655da42797c03fd163a3379d5cfa67ba1f1655e974a2a1a9"
)
sha256sums_x86_64=("18773fa82b70160e77a64c788647c8e252f06e9bc2cd3f1cacea2e159206b0ef")
sha256sums_aarch64=("cab8a58afec9b223f212ee3c535db16c0d873dcbde70036751058602efc21065")
sha256sums_armv6h=("a537422bfbb2dd8dba1c1b756fdcaeb6142a313cb4d1d7cbd86e1311bb842ffe")
sha256sums_armv7h=("edebea9d868d8dbfefd8e9fb47f423bfe1a672566836b7518f1aa930b0eb2aff")

backup=("etc/agate/agate.conf")
provides=("agate")

package() {
    install -Dm644 agate.conf "$pkgdir/etc/agate/agate.conf"
    install -Dm644 agate@.service "$pkgdir/usr/lib/systemd/system/agate@.service"
    install -Dm644 agate.sysusers "$pkgdir/usr/lib/sysusers.d/agate.conf"
    install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    find "${srcdir}" -type f \
        -iname "agate-$pkgver-*" \
        -exec install -Dm755 '{}' "$pkgdir/usr/bin/agate" \;
}
