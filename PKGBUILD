# Maintainer: Mathieu Clabaut <mathieu[at]clabaut.net>

pkgname=prometheus-process-exporter-bin
pkgver=0.7.10
pkgrel=2
pkgdesc="Prometheus exporter that mines /proc to report on selected processes"

arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'arm')
url="https://github.com/ncabatoff/process-exporter"
license=('Apache')
depends=()
makedepends=()
backup=('etc/prometheus/process.yml')
provides=('prometheus-process-exporter')
conflicts=('prometheus-process-exporter')
source=( 'process-exporter.service' 'process.yml' )
source_x86_64=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv7.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv6.tar.gz")
source_arm=("${url}/releases/download/v${pkgver}/process-exporter-${pkgver}.linux-armv6.tar.gz")

package() {
	case "$CARCH" in
		'x86_64') ARCH='amd64';;
		'arm') ARCH='armv6';;
		'armv6h') ARCH='armv6';;
		'armv7h') ARCH='armv7';;
		'aarch64') ARCH='arm64';;
    esac
    cd "${srcdir}/process-exporter-${pkgver}.linux-${ARCH}"

    # Install Binary
    install -D -m0755 process-exporter \
        "${pkgdir}/usr/bin/process-exporter"

    # Install SystemD Service File
    install -D -m0644 "${srcdir}/process-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/process-exporter.service"
    #Install example configuration
    install -D -m0644 "${srcdir}/process.yml" \
        "${pkgdir}/etc/prometheus/process.yml"
}
sha256sums=('70a8611709a0ec52f7157d9488f1e6632fa5ff360871c2591407b3604da21eb4'
            '5473359eb2eb8c17698a5c3d3c9e1836f74a1fdc83c3b6a45c9869920919abe1')
sha256sums_x86_64=('52503649649c0be00e74e8347c504574582b95ad428ff13172d658e82b3da1b5')
sha256sums_aarch64=('b377e673558bd0d51f5f771c2b3b3be44b60fcac0689709f47d8c7ca8136f6f5')
sha256sums_armv7h=('a92d5444be7e93dbf41db2ce20dfd2694130be94b5647b35c4ec43e6c46f774a')
sha256sums_armv6h=('5c33050db3540bc56e3fd69433ca1294f52b06e03ebd7c19e8e71bd12cc8258e')
sha256sums_arm=('5c33050db3540bc56e3fd69433ca1294f52b06e03ebd7c19e8e71bd12cc8258e')
