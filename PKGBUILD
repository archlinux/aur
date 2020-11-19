# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit
pkgver=0.16.2199
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

b2sums_x86_64=('a9ebb97377c93aca2fd057c66f025ed47a078c3d7b6212ee8c58a77d781e8ecde954dbcb2d232b0c673cf3125874069991f2d57b071db21ca0841f827467c4cb')
b2sums_armv7h=('aa352cada3a7ee4740a16d56d94ed841fbf02215eb43c7b7623497ccf08b814f317b896db84afad7033d634aa17450dc5d14bde6ff0438ae42475c290fcbe65e')
b2sums_aarch64=('d024d9e3423e4833a607b36515a2de351f8770b2f42beab589134c9de84b72b562ea06b29c7ef9462fe1136b8916e14b65331d24ed96911a17beb7fd1c5db75b')

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
