# Maintainer: George Shammas <george@shamm.as>
# Upstream author: dadevel <dadevel@disroot.org>

pkgname=wg-netns
_pkgname="${pkgname}"
pkgver=2.0.1
_pkgver="${pkgver}"
pkgrel=1

pkgdesc='WireGuard with Linux Network Namespaces (netns)'
url="https://github.com/dadevel/wg-netns"
arch=('any')
license=('MIT')

depends=('wireguard-tools' 'python' 'iproute2')
optdepends=('python-yaml: yaml config support')

source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/dadevel/${_pkgname}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('119c80551197948141f6be595c507df5074e876ef29d9b1cdc46a62e257e407f')

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    install -m 0644 -D LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -m 0644 -D README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    install -m 0755 -D ./wg-netns.py "${pkgdir}/usr/bin/wg-netns"
    install -m 0644 -D -t "${pkgdir}/usr/lib/systemd/system" ./wg-netns@.service
}
