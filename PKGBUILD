# Maintainer: Adam Brenner <adam@aeb.io>
pkgname=motionpro
pkgver=9.4.0.253
pkgrel=1
pkgdesc="Array Networks VPN Client for Linux (cli)"
arch=('x86_64')
url="https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html"
license=('unknown')
depends=('net-tools' 'bash')
source=('https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_253/vpn_cmdline_linux64_v1.0.54.zip'
        'vpn_cmdline.sh')
sha256sums=('673f260d8ebcbefd9b080416bf0790a2603a9aab16ffc62940cffc3dc2615925'
            '5754c4526d92a703accaa89cf6b114bd8d93372164949ae3d4fa7483f5d44394')

# Array Network Incorrect SSL Setup
DLAGENTS=('https::/usr/bin/curl --insecure -o %o %u')

package() {

    install -Dm 755 ${srcdir}/vpn_cmdline.sh ${pkgdir}/usr/bin/vpn_cmdline

    for filename in "array_vpnc" "vpn_cmdline"; do
        dst_name=${filename}
        if [ ${dst_name} == "vpn_cmdline" ]; then
            dst_name="vpn_cmdline_source"
        fi
        install -Dm 755 ${srcdir}/${filename} ${pkgdir}/usr/bin/${dst_name}
    done
}
