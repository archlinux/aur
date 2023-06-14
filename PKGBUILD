# Maintainer: Meow King <mr.ziqiyang@gmail.com>
pkgname=flying-carpet-bin
pkgver=7.1 # NOTE
pkgrel=1
pkgdesc="File transfer between Android, iOS, Linux, macOS, and Windows over ad hoc WiFi. No network infrastructure required, just two devices with WiFi chips in close range. "
arch=("x86_64")
url="https://github.com/spieglt/FlyingCarpet"
license=('unknown') # currently no license available, previous it is BSD 3-Clause
makedepends=(
    "libarchive" # bsdtar
)
depends=()
provides=("flying-carpet") 
conflicts=("flying-carpet")
changelog="changelog.txt" # NOTE
source=("${url}/releases/download/v${pkgver}/linux_flying-carpet_${pkgver}.0_amd64.deb")
sha256sums=('0bd24ecee6ea20cfbc80d825cf8f9228fa837ce3aa141f7a4705190621b0a11b')

prepare() {
    bsdtar -xf data.tar.gz
}

package() {
    # bin
    install -Dm755 usr/bin/flying-carpet ${pkgdir}/usr/bin/flying-carpet
    # icons
    mkdir -p ${pkgdir}/usr/share/icons/
    chmod 755 ${pkgdir}/usr/share/icons
    cp -r usr/share/icons/hicolor ${pkgdir}/usr/share/icons/
    # desktop file
    install -Dm644 usr/share/applications/flying-carpet.desktop ${pkgdir}/usr/share/applications/flying-carpet.desktop
}
