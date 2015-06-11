# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=tideways-daemon
pkgver=1.2.4
pkgrel=1
pkgdesc="Tideways Profiler Daemon"
arch=('i686' 'x86_64')
url="https://tideways.io"
license=('custom')
install=tideways-daemon.install

if [[ $CARCH == "x86_64" ]]; then
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-daemon_linux_amd64-${pkgver}.tar.gz")
    sha256sums=('0541f61f253746029f993d5f56bf6bed42e24e5b038cb3656fa0f75f7b3ef388')
    _arch=amd64
else
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-daemon_linux_i386-${pkgver}.tar.gz")
    sha256sums=('b83057204db31d82f2294e437d55fb0326100e04b34e092506079f3938c362c9')
    _arch=i386
fi

source+=('tideways-daemon.service' 'tmpfiles.conf' 'sysusers.conf')
sha256sums+=('e30dba70919aefb00d8971da9cda001bb850e29d0025246ab76bec26f33bba06'
             '520b99347e7ba822235c03d2791bc17b12b899bcaaed323ca66dd42a55675f40'
             '1f50f02fa3d71f42c73d254f1d4667d5517794fec8c7d478abdd9e8f8e35018a')

package() {
    cd "${srcdir}/tideways-daemon_${pkgver}"
    install -Dm755 tideways-daemon "${pkgdir}"/usr/bin/tideways-daemon
    install -Dm644 LICENSE         "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 logrotate.conf  "${pkgdir}/etc/logrotate.d/${pkgname}"

    install -Dm644 ../tideways-daemon.service "${pkgdir}"/usr/lib/systemd/system/${pkgname}.service
    install -Dm644 ../tmpfiles.conf           "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
    install -Dm644 ../sysusers.conf           "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}

