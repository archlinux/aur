# Maintainer: Rene Hollander <mail@renehollander.at>

pkgname=prometheus-zfsprom-exporter
pkgver=1.0.6
pkgrel=1
pkgdesc="Prometheus exporter for (some) ZFS statistics via zpool iostatus and zfs get space."
arch=("any")
url="https://github.com/matusnovak/prometheus-zfs"
license=("unlicense")

depends=("python" "python-prometheus_client" "python-pylibzfs")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matusnovak/prometheus-zfs/archive/refs/tags/v${pkgver}.tar.gz"
        prometheus-zfsprom-exporter.service)
sha512sums=('e7985f550501137f72c48769cbbc450f3ae12b557076eff4a71ee02ad2655411e517ec70cf559ada0ae7abaf5bbdd520f01842c6198541368ef377d35f3c117d'
            'SKIP')

package() {
    install -Dm644 "prometheus-zfsprom-exporter.service" "$pkgdir/usr/lib/systemd/system/prometheus-zfsprom-exporter.service"

    cd "prometheus-zfs-${pkgver}"

    install -Dm755 "zfsprom.py" "$pkgdir/usr/bin/prometheus-zfsprom-exporter"
}
