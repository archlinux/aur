# Maintainer: Sean Brar <contact@seanbrar.com>
pkgname=igir-bin
pkgver=5.3.0
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
sha256sums_x86_64=('ac2694fb23e526cfb62512b92359dca6916b9167a3fbab89f8df92b54ea57b9b')
sha256sums_aarch64=('e80c4f3434b81f09ccd5d6e6fd1edeed9951702706696bed630b0cb64b4dd41c')

package() {
    cd "${srcdir}"

    # Install the binary into /usr/bin
    install -Dm755 "igir" "${pkgdir}/usr/bin/igir"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
