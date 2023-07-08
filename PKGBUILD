# Maintainer: taotieren <admin@taotieren.com>

pkgname=pc-nrfconnect-programmer
pkgver=3.0.2
pkgrel=0
epoch=
pkgdesc="Programmer app for nRF Connect for Desktop"
arch=('any')
url="https://github.com/NordicSemiconductor/pc-nrfconnect-programmer"
license=('Nordic-4-Clause')
groups=()
depends=()
makedepends=('npm')
checkdepends=()
optdepends=("nrf-udev: udev rules for nRF (Nordic Semiconductor) development kits"
            "jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('af29a119f8fb500bbd6b88093f1ac7bb14267aad5f1a03d30669980f0445ec38')
#validpgpkeys=()

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
