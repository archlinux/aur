# Contributor: taotieren <admin@taotieren.com>

pkgname=chaosblade-bin
pkgver=1.7.2
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
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('94214d09b6c454065592267df682a45409bc74b2f2cf840bdfc9eb77ccccfbdc')
noextract=(${pkgname%-bin}-${pkgver}.tar.gz)

package() {
    install -dm0755 "${pkgdir}/usr/share/${pkgname%-bin}/"

    bsdtar xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" --strip-components=1 -C  "${pkgdir}/usr/share/${pkgname%-bin}"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/blade" << EOF
#!/bin/sh

/usr/share/${pkgname%-bin}/blade "\$@"

EOF

}
