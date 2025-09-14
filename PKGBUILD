# Contributor: taotieren <admin@taotieren.com>

pkgname=chaosblade-bin
pkgver=1.7.5
pkgrel=1
pkgdesc="Chaosblade: An Easy to Use and Powerful Chaos Engineering Toolkit"
arch=(x86_64)
url="https://github.com/chaosblade-io/chaosblade"
license=('Apache-2.0')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
#replaces=(${pkgname})
depends=('go' 'docker')
makedepends=('libarchive')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux_amd64.tar.gz")
sha256sums=('da6391c55721bdc92a5d3a82ce447de8f2967f75a973129f528ead10f841485d')
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-bin}/"

    bsdtar xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/usr/share/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/blade" <<EOF
#!/bin/sh

/usr/share/${pkgname%-bin}/blade "\$@"

EOF

}
