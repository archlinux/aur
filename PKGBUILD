# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=5.1.1
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
sha256sums_x86_64=('88b6e766f41e8a0a7e1adc50e6cb5b9599570c8f0905b01f877c5f71da506160')
sha256sums_aarch64=('98a577c58bc385ac5fe1c626ea831bf44e5163d7f3503a119974f97dc95ef18b')

package() {
    cd "${srcdir}"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "${pkgdir}/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
