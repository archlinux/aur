# Maintainer: George Shammas <george@shamm.as>
# Upstream author: dadevel <dadevel@disroot.org>

pkgname=wg-netns
_pkgname="${pkgname}"
pkgver=2.3.2
_pkgver="${pkgver}"
pkgrel=1

pkgdesc='WireGuard with Linux Network Namespaces (netns)'
url="https://github.com/dadevel/wg-netns"
arch=('any')
license=('MIT')

depends=('wireguard-tools' 'python' 'iproute2')
optdepends=('python-yaml: yaml config support')

source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/dadevel/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a0d02bc9a9409a1c3aa1ca345ea2f0fd3672b6850b81b6ac575076bea2d7f5bd')

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    install -m 0644 -D LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m 0644 -D README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    install -m 0755 -D ./wgnetns/main.py "${pkgdir}/usr/bin/wg-netns"
    install -m 0644 -D -t "${pkgdir}/usr/lib/systemd/system" ./extras/wg-netns@.service
}
