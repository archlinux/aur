# Maintainer: Niko <aurpkgs@niko.lgbt>
# Contributor: Valentin Elovskiy <evvsoft@gmail.com>

_pkgname=prometheus-redis-exporter
pkgname=${_pkgname}-bin
pkgver=1.87.0
pkgrel=1
pkgdesc="Prometheus exporter for Redis (binary version)"
arch=('x86_64' 'aarch64' 'i686' 'armv7' 'mips64' 'mips64le' 'ppc64' 'ppc64le' 's390x')
url="https://github.com/oliver006/redis_exporter"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}.service")

# go's "386" is actually i686
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-386.tar.gz")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-amd64.tar.gz")

# minimum supported ARM version for 32 bit ARM builds *seems* to be armv7?
source_armv7=("${pkgname}-${pkgver}-armv7.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-arm64.tar.gz")

source_mips64=("${pkgname}-${pkgver}-mips64.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-mips64.tar.gz")
source_mips64le=("${pkgname}-${pkgver}-mips64le.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-mips64le.tar.gz")

source_ppc64=("${pkgname}-${pkgver}-ppc64.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-ppc64.tar.gz")
source_ppc64le=("${pkgname}-${pkgver}-ppc64le.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-ppc64le.tar.gz")

source_s390x=("${pkgname}-${pkgver}-s390x.tar.gz::${url}/releases/download/v${pkgver}/redis_exporter-v${pkgver}.linux-s390x.tar.gz")

sha256sums=('1c05b90c56e9740c5ab757e629f677471b88e92d5a22a16c8e26e44820ac6e47')
sha256sums_x86_64=('f9d7b1d432a7f67fff5510de7b20ae1afae7490630749835b171d5c016c6b959')
sha256sums_aarch64=('e1b2bf3be908b25f66f4191a72199271ba3b13bef0b86f7d23983e0635a1fb04')
sha256sums_i686=('9ca609153f62d2b0c945f693496dcda4be2f1b2ce338dbc2698bc2063f54682e')
sha256sums_armv7=('9074f89baeb4db602036ddf8b51b12e215defef78374265e894191fb665950aa')
sha256sums_mips64=('01f324580a27698cd7a218c534afbfd8030b3e530ea4b53d672de702ee033e9c')
sha256sums_mips64le=('e42a675685769f9dd46c372ebe6018ec65b56ddba084bde9b19513ab8ef365d0')
sha256sums_ppc64=('c833a3820b2d43e8684cdf86615fcde2aea5b32352b4cb5ba91214f169572fb0')
sha256sums_ppc64le=('c4d3cc1847d1a523cffa9c5dfb62ba9293e84820f5ac2f7a788e70365433c00e')
sha256sums_s390x=('6a7bbfefdedbe092fbf7b159d635ea0e9a1b8817a400354d0008b6d4ad8e3336')

package() {
	case $CARCH in
		"x86_64")	FAKE_ARCH=amd64;;
		"aarch64")	FAKE_ARCH=arm64;;
		"i686")		FAKE_ARCH=386;;
		"armv7")	FAKE_ARCH=arm;;
		*)		FAKE_ARCH=$CARCH;;
	esac

	cd "${srcdir}/redis_exporter-v${pkgver}.linux-${FAKE_ARCH}"

	install -Dm755 redis_exporter				"${pkgdir}/usr/bin/prometheus_redis_exporter"
	install -Dm644 ../prometheus-redis-exporter.service	-t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE					-t "${pkgdir}/usr/share/licenses/${_pkgname}/"
	install -Dm644 README.md				-t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
