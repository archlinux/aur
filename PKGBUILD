# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname=ttos
pkgver=1.0.0
pkgrel=1
arch=("x86_64")
url="https://github.com/shyaminayesh/ttos"
pkgdesc="Tunnel TO Socket"
makedepends=("go")
source=(
    "ttos.service"
    "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
    "a51b9decea787b828804b89163dddc05ed755d2836c9717f8cc65f0fd137a6f0"
    "66f7cd1995291b314015c220c996109763425f9f12340b3ecf785b485f4ffb16"
)
validpgpkeys=("202164AC7B099EC3C4ECD161FC3F05FA01F8DD0E")

build() {
    cd "${pkgname}-${pkgver}"
    make dist
}

package() {
    install -d "${pkgdir}/usr/share/ttos"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/share/ttos/${pkgname}"
    install -D "$srcdir/ttos.service" "$pkgdir/usr/lib/systemd/system/ttos.service"
}
