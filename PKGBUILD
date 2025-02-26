# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=agate-bin
pkgver=3.3.13
pkgrel=2
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
source_x86_64=("https://github.com/mbrubeck/agate/releases/download/v$pkgver/agate.x86_64-unknown-linux-gnu.gz")
source_aarch64=("https://github.com/mbrubeck/agate/releases/download/v$pkgver/agate.aarch64-unknown-linux-gnu.gz")
source_armv6h=("https://github.com/mbrubeck/agate/releases/download/v$pkgver/agate.arm-unknown-linux-gnueabihf.gz")
source_armv7h=("https://github.com/mbrubeck/agate/releases/download/v$pkgver/agate.armv7-unknown-linux-gnueabihf.gz")

sha256sums=(
    "c74d88a5a449892a79221f6931989f60019dbcc9fcc8ecf57da34dca5778b80e"
    "7d044c20605bdd974775cdb1ae2229dbe9c86884f8a403f75818ac5bd37f567f"
    "8dc4041d1a673eeb87118385fbc60c74ee9422535251e16f64f5c76e8e7b72cf"
    "0b28172679e0009b655da42797c03fd163a3379d5cfa67ba1f1655e974a2a1a9"
)
sha256sums_x86_64=("42edcfb9efe8dd45ae409e2a7200671bd68d3592dab453d86715a0e267cb727e")
sha256sums_aarch64=("a42f9ed795540331c288438dee1573122aa5e6acf0ae795fced47d00893f595f")
sha256sums_armv6h=("575c93f2eb1996d0d53d03b4a853c7bd06b498196325d7239701dd86ad7b7e5c")
sha256sums_armv7h=("06bddb59a62a11197196331490e6bdb4055c3cf2b9f512dc40f1a6d228b20af3")

backup=("etc/agate/agate.conf")
provides=("agate")

package() {
    install -Dm644 agate.conf "$pkgdir/etc/agate/agate.conf"
    install -Dm644 agate@.service "$pkgdir/usr/lib/systemd/system/agate@.service"
    install -Dm644 agate.sysusers "$pkgdir/usr/lib/sysusers.d/agate.conf"
    install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"

    find "${srcdir}" -type f \
        -iname 'agate.*-unknown-linux-*' \
        -exec install -Dm755 '{}' "$pkgdir/usr/bin/agate" \;
}
