# Maintainer: Hao Long <aur@esd.cc>

pkgname=cloudflared-bin
pkgver=2019.8.1
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
source_x86_64=("https://bin.equinox.io/a/m5PMfzZBzxy/cloudflared-2019.8.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/5dbyxANt18r/cloudflared-2019.8.1-linux-386.tar.gz")
source_armv6h=("https://bin.equinox.io/a/8fJhfyykATC/cloudflared-2019.8.1-linux-arm.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8fJhfyykATC/cloudflared-2019.8.1-linux-arm.tar.gz")
sha256sums=('6a486a0f6c00e87cce1caf0aa8db45ea9fefd0bf91d9be6fc44460160dc0dbda'
            'e769786afdfbd486a4d7ca99495dbe955c25e41b5e012b722b018ca17f269dac'
            '791ec5bebea5863544f5e0db0d9184a5bbb75e66725f7505e83e252f51d84376'
            'bc40e3f7e1b21b93a949a1b1c05639584943d9ce9cc7ccb96612688eeb9fd206'
            'bfda935c07b8e49821ee13e19433b1ed475ebb651e3008a32950734afbaef813')
sha256sums_x86_64=('136a7abee31b0e814986622263907e095fb506f53ac4601dfc0505121d21b65a')
sha256sums_i686=('4a40fcd4435cb76793a4b5cb8d8c62d3142d8c015845285ba004b8b4f93f62b9')
sha256sums_armv6h=('42793f8654e4540eb8782c6607bf603c7a884cdb0d21ee71de9d67f7861bf1db')
sha256sums_armv7h=('42793f8654e4540eb8782c6607bf603c7a884cdb0d21ee71de9d67f7861bf1db')

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
