# Maintainer: linuxer <linuxer@artixlinux.org>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=jackett-runit
pkgver=0.17.168
pkgrel=1
pkgdesc='Use many torrent trackers with software that supports torznab/potato feeds.'
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL')
url='https://github.com/Jackett/Jackett'
depends=('curl' 'openssl-1.0' 'runit')
conficts=('systemd' 'openrc' 's6' 'jackett' 'jackett-mono')
options=('!strip' 'staticlibs')

source=("jackett.run"
        "jackett.sysusers"
        "jackett.tmpfiles"
        "jackett.install")

source_x86_64=("Jackett.Binaries.LinuxAMDx64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxAMDx64.tar.gz")
source_armv7h=("Jackett.Binaries.LinuxARM32-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM32.tar.gz")
source_aarch64=("Jackett.Binaries.LinuxARM64-${pkgver}.tar.gz::https://github.com/Jackett/Jackett/releases/download/v${pkgver}/Jackett.Binaries.LinuxARM64.tar.gz")

b2sums=('fed3336e07fe1d88a65bad5fb4f3e081ec16b24c07cc2a96462e7cecc3962b9742897455c0ce7f7fdbe04ecb337c575d54194d2dedad865f72572a5158cc6ef4'
        '6b0534e5f3320e70cff1cc59b0c4de202451d6bc240c0659749929a72223fcb8e636508b14905e3d449c854ae6774c4349480039dd50e35d1d01ac13fa15eea3'
        '4837363802330a33153e8b1560074d3af1c24c393287d295083dc41c82d6667ef0eb1dbcabc6afd180082405762bfed749adc7483d0c6fab0be431f944b4c001'
        'bccae26aece8872da424e8a2076c6a97ec7523026a6c4320e0a3d573452e06e0c36bd65374ecd45f809c107e21902c91b2c6546365b49a173b3f7c775d891b11')

b2sums_x86_64=('a7426ddd3911e3e29f4702d3790fb87164c192e944df7a0f562817bb461b9e49c9d89e62944928958bb335bc9e1898c659ad8547c89ae680a09c2b574b1e9c70')
b2sums_armv7h=('68fd0c4f5702a3dae8005a087a811ae5bedb1c3fbf8dd64b19c929a0988523dd78c62feeafb9153ce2cb7609f30d94fcaa316ac0051e41b2f1675e1ddaa3b5a1')
b2sums_aarch64=('8e6bc6ac1b4e81fd28f35eba3ba151047b51930d15afd0165ccbcc82c1bdb2dfd2096fc0dbfa281cbf63101a59cdb65e103eb0afdf95544936fded9d5fc723ea')

package() {
    cd "$srcdir"
       
    install -d -m 755 "${pkgdir}/usr/lib/jackett/"
    install -d -m 755 "${pkgdir}/home/jackett/runit/service"
    install -d -m 755 "${pkgdir}/etc/runit/sv/jackett/"
    cp -dpr --no-preserve=ownership "${srcdir}/Jackett/"* "${pkgdir}/usr/lib/jackett/"

    install -D -m 644 "${srcdir}/jackett.sysusers" "${pkgdir}/usr/lib/sysusers.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/jackett.conf"
    install -D -m 644 "${srcdir}/jackett.run" "${pkgdir}/etc/runit/sv/jackett/run"
    chmod +x "${pkgdir}/etc/runit/sv/jackett/run"
    install=jackett.install
}
