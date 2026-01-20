# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=infra-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Authentication and access management to servers, clusters, and databases"
arch=('x86_64' 'aarch64')
url="https://github.com/infrahq/infra"
license=('custom:Elastic-2.0')
depends=('glibc' 'gcc-libs')
optdepends=(
    'openssh: for SSH server access management'
    'kubectl: for Kubernetes cluster access'
    'postgresql: for database backend'
)
provides=('infra')
conflicts=('infra')
source_x86_64=("${url}/releases/download/v${pkgver}/infra_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/infra_${pkgver}_arm64.deb")
sha256sums_x86_64=('e3779e63df57c07c0ad136c1a1435cd9d30ce0ae9a41248c18bf0b6f67d404b1')
sha256sums_aarch64=('15f53213739d0fe59bf2e86c0a6fb2d205a2532915ab2e9a20271c245ae3c224')

package() {
    bsdtar -xf data.tar.* -C "${srcdir}"
    cp -r "${srcdir}"/usr "${pkgdir}/"
    
    install -Dm644 "${pkgdir}/usr/share/doc/infra/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}