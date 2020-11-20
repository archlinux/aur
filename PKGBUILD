# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit
pkgver=0.16.2207
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0' 'runit')
conficts=('systemd' 'openrc' 's6' 'jackett' 'jackett-mono')
options=('!strip' 'staticlibs')

source=("run"
        "jackett.sysusers"
        "jackett.tmpfiles")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")

b2sums=('fed3336e07fe1d88a65bad5fb4f3e081ec16b24c07cc2a96462e7cecc3962b9742897455c0ce7f7fdbe04ecb337c575d54194d2dedad865f72572a5158cc6ef4'
        '6b0534e5f3320e70cff1cc59b0c4de202451d6bc240c0659749929a72223fcb8e636508b14905e3d449c854ae6774c4349480039dd50e35d1d01ac13fa15eea3'
        '4837363802330a33153e8b1560074d3af1c24c393287d295083dc41c82d6667ef0eb1dbcabc6afd180082405762bfed749adc7483d0c6fab0be431f944b4c001')

b2sums_x86_64=('528c208d9a8a5663cc6025afc76caa7e251f778457eb448e03c20734b9b169f48fdb91e7c448492e0475e048a28c44940bcc6da544acb39ac940ccdff239cd42')
b2sums_armv7h=('c30e22172afcbdf2a3aa6cc642663acfa43bb20fa39a4c4b3d328bb11e4d7c735dd6356921482d87d0af00ed15d4258721452231a22220be052b282fc8f4d2e4')
b2sums_aarch64=('657cd555cef851ecd3bf361e2bc50382f963af1153b308aeddc1cafa788e65310553426b58cc9808d06b75df863c528b9e75e3352d9cd38b508aad2288f49837')

package() {
    cd "$srcdir"
       
    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    install -d -m 755 "${pkgdir}/home/jackett/runit/service"
    install -d -m 755 "${pkgdir}/etc/runit/sv/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
    install -D -m 644 "${srcdir}/run" "${pkgdir}/etc/runit/sv/jackett/run"
    chmod +x "${pkgdir}/etc/runit/sv/jackett/run"
    
}
