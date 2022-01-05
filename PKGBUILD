# Contributor: taotieren <admin@taotieren.com>

pkgname=chaosblade-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Chaosblade: An Easy to Use and Powerful Chaos Engineering Toolkit"
arch=('any')
url="https://github.com/chaosblade-io/chaosblade"
license=('Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname%-bin} ${pkgname/-bin/-git})
#replaces=(${pkgname})
depends=('go' 'docker')
makedepends=('libarchive')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-bin}-${pkgver}.tar.gz::https://ghproxy.com/${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('b5ad725289ee8919d30a0afe03182ef16f45f7dc756ea24887721f735c4e1e99')
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-bin}/"

    bsdtar xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" --strip-components=1 -C  "${pkgdir}/usr/share/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/blade" << EOF
#!/bin/sh

/usr/share/${pkgname%-bin}/blade "\$@"

EOF

}
