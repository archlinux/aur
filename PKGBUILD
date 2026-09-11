# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=5.5.0
pkgrel=1
pkgdesc="A zero-setup ROM collection manager"
arch=('x86_64' 'aarch64')
url="https://github.com/emmercm/igir"
license=('GPL-3.0-only')
depends=('glibc')
provides=("igir")
conflicts=("igir")

# Disable stripping to prevent corruption of the igir binary.
# Stripping modifies the binary in a way that causes runtime errors.
options=(!strip !debug)

source=("LICENSE::https://raw.githubusercontent.com/emmercm/igir/v${pkgver}/LICENSE")
source_x86_64=("igir-${pkgver}-Linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/igir-${pkgver}-Linux-amd64.tar.gz")
source_aarch64=("igir-${pkgver}-Linux-arm64v8.tar.gz::${url}/releases/download/v${pkgver}/igir-${pkgver}-Linux-arm64v8.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('f6643b34b921a53ec437b74b21ca4d364187e3341d806c97be3684c71008561c')
sha256sums_aarch64=('cccc596a1429001a46e2c2470af1ff514f43dd0aa2361648c54bb472a5119efc')

package() {
    cd "${srcdir}"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "${pkgdir}/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
