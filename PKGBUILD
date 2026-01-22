# Maintainer: taotieren <admin@taotieren.com>

pkgname=thunder-nas-bin
_tagname=3.20.2
pkgver=${_tagname//-/_}
pkgrel=1
pkgdesc="Thunder (Xunlei) remote download service program extracted from thunder Synology suite for other devices"
arch=(x86_64)
url="https://github.com/cnk3x/xunlei"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
#replaces=(${pkgname})
depends=()
makedepends=()
optdepends=()
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "xlp-amd64-${pkgver}.tar.gz::${url}/releases/download/v${_tagname}/xlp-amd64.tar.gz"
    "https://github.com/cnk3x/xunlei/raw/refs/heads/main/LICENSE"
    thunder-nas.{sysusers,tmpfiles,service}
)
sha256sums=('5ed2af4bfea6a98e655bc80cf58d2617b64c9a0086e0ddf898b826580848ac1f'
            'eabe4ae8a7885a2d00da4bbfb18e9a55b8fba68bb8d0d06d3701a6bf6726faef'
            '86ef730efbb7ab007c0b65e3c54bf641241e8a85fdc70a274b80d40c239e76f3'
            '0ccb638b7dddf17112bc533ab8e8d38f53efe64db3c78a54259481d823501c50'
            '90656d7ea9795d84858ba2bf4cbedc8e546f7fde4cecd851637181d54d64a93a')

package() {
    install -Dm755 "${srcdir}/xlp" ${pkgdir}/usr/bin/${pkgname%-bin}
    install -Dm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -dm755 "${pkgdir}/usr/syno/synoman/webman/modules" \
        "${pkgdir}/xunlei" \
        "${pkgdir}/var/packages/pan-xunlei-com/"

    install -Dvm644 "${srcdir}/thunder-nas.sysusers" "${pkgdir}/usr/lib/sysusers.d/thunder-nas.conf"
    install -Dvm644 "${srcdir}/thunder-nas.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/thunder-nas.conf"
    install -vDm644 "${srcdir}/thunder-nas.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
