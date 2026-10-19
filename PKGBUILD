# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=super-trouper-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="MCP server for Frida"
arch=('x86_64' 'aarch64')
url="https://github.com/crissyfield/super-trouper"
license=('MIT')
provides=('super-trouper')
conflicts=('super-trouper')
depends=()
options=('!debug')
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://github.com/crissyfield/super-trouper/releases/download/v${pkgver}/super-trouper-${pkgver}-linux-amd64-musl.tar.xz")
sha256sums_x86_64=('e9f6c9d900c905f8695c2e1153ad5d95b2b21afad10c38cc8d325a21d9daf5e8')
sha256sums_aarch64=('dcf4a7a6bbd3626de1eba1ac823cb79ad717763122eb23de0e7aeeee99c2ba43')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::https://github.com/crissyfield/super-trouper/releases/download/v${pkgver}/super-trouper-${pkgver}-linux-arm64-musl.tar.xz")

latestver() {
    gh api repos/crissyfield/super-trouper/releases/latest --jq '.tag_name' | sed 's/^v//'
}

package() {
    _bin="$(find "$srcdir" -maxdepth 3 -type f -executable | head -1)"
    [ -n "$_bin" ] || { echo "error: no executable in $srcdir (tarball extracted?)"; exit 1; }
    install -Dm755 "$_bin" "${pkgdir}/usr/bin/super-trouper"
}
