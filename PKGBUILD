# Maintainer: Rene Hollander <mail@renehollander.at>

pkgname=prometheus-zfsprom-exporter
pkgver=1.0.4
pkgrel=1
pkgdesc="Prometheus exporter for (some) ZFS statistics via zpool iostatus and zfs get space."
arch=("any")
url="https://github.com/matusnovak/prometheus-zfs"
license=("unlicense")

depends=("python" "python-prometheus_client" "python-pylibzfs")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/matusnovak/prometheus-zfs/archive/refs/tags/v${pkgver}.tar.gz"
        prometheus-zfsprom-exporter.service)
sha512sums=('be29acfe2288af70708fedcc38f5158e3e5fcc46c8f798873833f93dfabd06b86b36fc7014f684bbf7853aa069e362370f1e64afbc0e29e4668583dce27152f7'
            'SKIP')

package() {
    install -Dm644 "prometheus-zfsprom-exporter.service" "$pkgdir/usr/lib/systemd/system/prometheus-zfsprom-exporter.service"

    cd "prometheus-zfs-${pkgver}"

    install -Dm755 "zfsprom.py" "$pkgdir/usr/bin/prometheus-zfsprom-exporter"
}
