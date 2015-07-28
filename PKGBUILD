# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=tideways-daemon
pkgver=1.2.5
pkgrel=1
pkgdesc="Tideways Profiler Daemon"
arch=('i686' 'x86_64')
url="https://tideways.io"
license=('custom')
install=tideways-daemon.install

if [[ $CARCH == "x86_64" ]]; then
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-daemon_linux_amd64-${pkgver}.tar.gz")
    sha256sums=('972b0d224bfdd4bd926441f67b5d87db22150c1bd91cbd9400bed616b0dd92c1')
else
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-daemon_linux_i386-${pkgver}.tar.gz")
    sha256sums=('21d06a8328b6a2003af48205649ce9fb9ce5744f1b650041281ab80649501760')
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

