# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.3.25
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
    "b7edf837f2719f56c7c728813862fe1f1dc96bfdbaeb060450943d0b979710dc"
)
sha256sums_x86_64=("37af86aea6565dd485aaa308c693966dfe539c5c82af5fdb784a126429320db1")
sha256sums_aarch64=("9487eb6d12e2dbd66941e018c237c1c0190b7a346ba82cfd1d9bd7e6d9975d28")
sha256sums_armv6h=("da3d5e06763b9069da74d10a5e344d40529ea200b836b9a77be5843de49815a7")
sha256sums_armv7h=("eae0d97b1238c43960f1696a7e812e10683e95a9b135e9bc41c3ded094ee4f36")

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
