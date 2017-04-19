# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=graylog-collector-sidecar
pkgver=0.1.1
pkgrel=1
pkgdesc="A supervisor process for 3rd party log collectors like NXLog or Filebeat"
url="https://github.com/Graylog2/collector-sidecar"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('filebeat')
backup=('etc/graylog/collector-sidecar/collector_sidecar.yml')
source=("https://github.com/Graylog2/collector-sidecar/releases/download/${pkgver//_/-}/collector-sidecar-${pkgver//_/-}.tar.gz"
        "default_collector_sidecar.yml")
md5sums=('SKIP' 'SKIP')
install="${pkgname}.install"

package() {
    linux_bin_pathprefix="${srcdir}/collector-sidecar/${pkgver%%_*}/linux"
    uname_machine=$(uname -m)

    # Create empty directories
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/var/log/graylog/collector-sidecar
    mkdir -p ${pkgdir}/var/cache/graylog/collector-sidecar
    mkdir -p ${pkgdir}/etc/graylog/collector-sidecar/generated

    # Copy the default collector_sidecar config to our config directory
    cp ${srcdir}/default_collector_sidecar.yml ${pkgdir}/etc/graylog/collector-sidecar/collector_sidecar.yml

    # Copy the graylog-collector-sidecar binary from the appropriate folder to /usr/bin
    if [ $uname_machine == "x86_64" ]; then
        cp "${linux_bin_pathprefix}/amd64/graylog-collector-sidecar" ${pkgdir}/usr/bin
    else
        cp "${linux_bin_pathprefix}/386/graylog-collector-sidecar" ${pkgdir}/usr/bin
    fi
}
