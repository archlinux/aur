# Maintainer: taotieren <admin@taotieren.com>

pkgname=canboatjs
_tagname=3.16.0-beta.4
pkgver=${_tagname//-/_}
pkgrel=3
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
source=("${pkgname}-${_tagname}.tar.gz::${url}/archive/refs/tags/v${_tagname}.tar.gz")
sha256sums=('27abb6c45f13084438212c9354365b3affc7ac5e470d190a5a33c9cc8e2f6ac0')
noextract=("${pkgname}-${_tagname}.tar.gz")

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${_tagname}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
