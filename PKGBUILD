# Maintainer: Niko <aurpkgs@niko.lgbt>
# Contributor: Valentin Elovskiy <evvsoft@gmail.com>

_pkgname=prometheus-redis-exporter
pkgname=${_pkgname}-bin
pkgver=1.86.0
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
sha256sums_x86_64=('20a97421cabceb8156aad227002ee813781e318d7c2192a439c86a91b5ef70ea')
sha256sums_aarch64=('a4ecc3bc631713835c1016ad5d6fb3dee8a05a9fbd7a90d4f0e00655bce6d5f3')
sha256sums_i686=('e596a9c7f7e34708cc7e68d1659286e08a9f0c8b3cfcc211618492d5716b866e')
sha256sums_armv7=('cd9a042785b7749b14f2ab56d1ba601192d4a92215b2614a66f55512efae5a2b')
sha256sums_mips64=('04c1d7e2dfbb376779351464fbffd119161d129022819d0963f2648458259086')
sha256sums_mips64le=('fb6ce7ab3c3648ec4b5f7d59605c742fe1c087b48b0c76ecae3e0c72eb69a56e')
sha256sums_ppc64=('b732c85d91fb4d31527d9bf87826c21b6650a902f1cc260329eb4f520abd5708')
sha256sums_ppc64le=('dc55e11196e1ae86dfb4dd3f7d35882aeb33ec02e9272e0dd83d32ad02de1a10')
sha256sums_s390x=('1ffb38025987a3bc90d2ad071bdaf7016ae646adb957366d97c27aeb01953a04')

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
