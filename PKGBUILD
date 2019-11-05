# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.10.4
pkgrel=1
pkgdesc="An Argo Tunnel client which proxies any local webserver through the Cloudflare network"
arch=("x86_64" "i686" "armv6h" "armv7h")
url="https://developers.cloudflare.com/argo-tunnel/"
license=("custom")
depends=("glibc")
provides=("cloudflared")
conflicts=("cloudflared")
source=("https://raw.githubusercontent.com/cloudflare/cloudflared/master/LICENSE"
        "cloudflared.yml"
        "cloudflared@.service"
        "cloudflared-dns.service"
        "sysusers.d")
source_x86_64=("https://bin.equinox.io/a/ijZqF95ph9v/cloudflared-2019.10.4-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/c55LA3YN9yX/cloudflared-2019.10.4-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/mRu1brvUS6Q/cloudflared-2019.10.4-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/mRu1brvUS6Q/cloudflared-2019.10.4-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '791ec5bebea5863544f5e0db0d9184a5bbb75e66725f7505e83e252f51d84376'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('4426d39941173abddd528f5840014337f7476287d69a2b0884bf04b2ba4e5815')
sha256sums_i686=('05abe991f640fbb375332ce610dfdd13838ad35c829981aea949eb9737c804f2')
sha256sums_armv6h=('8f6b5f91aa9b634c606efa450a4cc014002251d88faddc9787b3709925771be3')
sha256sums_armv7h=('8f6b5f91aa9b634c606efa450a4cc014002251d88faddc9787b3709925771be3')

package() {
    # Install License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # Install Binary
    install -Dm755 cloudflared ${pkgdir}/usr/bin/cloudflared

    # Configuration File
    install -Dm644 cloudflared.yml ${pkgdir}/etc/cloudflared/cloudflared.yml.example
    install -Dm644 -t ${pkgdir}/usr/lib/systemd/system cloudflared{@,-dns}.service

    # Post install
    install -Dm644 sysusers.d ${pkgdir}/usr/lib/sysusers.d/cloudflared.conf
}

# vim: ts=2 sw=2 et:
