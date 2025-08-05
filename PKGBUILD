# Maintainer: taotieren <admin@taotieren.com>

pkgname=canboatjs
pkgver=3.9.1
pkgrel=1
pkgdesc="Native javascript NMEA 2000 decoder and encoder"
arch=(any)
url="https://github.com/canboat/canboatjs"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=(npm)
backup=()
options=()
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a35551349ffccff71bc091154ac4d3f9c1ec5542c22854b2617c5bc306a7862')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
