# Maintainer: Integral <integral@murena.io>

pkgname=geekbench-preview
pkgver=6.3.0
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance (Preview Version)"
arch=('aarch64' 'riscv64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
source_aarch64=("https://cdn.geekbench.com/Geekbench-${pkgver}-LinuxARMPreview.tar.gz")
source_riscv64=("https://cdn.geekbench.com/Geekbench-${pkgver}-LinuxRISCVPreview.tar.gz")
sha512sums_aarch64=('e9992eb5c7038efdb721fd970bfcf8b0ee3e9d323a9e7cd98588514798560f16428c3e7c4d1d235d2a28320dc629305f29ec56a504923826d09136f4cfb7b775')
sha512sums_riscv64=('5f8ec8582778d4aeff3644bd19f50ec5431dedb5eafe4643bb21dcbbe29f231fed5d3fa344bbe3fc9c7632209f47197dd1ae8043cbe308d025262dd1706f7cc3')
conflicts=("geekbench")
provides=("geekbench")
options=('!strip')

package() {
	ARCH=$(uname -m)

	case $ARCH in
	aarch64)
		cd "Geekbench-${pkgver}-LinuxARMPreview/"
		;;
	riscv64)
		cd "Geekbench-${pkgver}-LinuxRISCVPreview/"
		;;
	esac

	# Binary Files
	install -Dm755 {geekbench6,geekbench_$ARCH} -t "${pkgdir}/opt/${pkgname}/"

	# Resource Files
	install -Dm644 {geekbench.plar,geekbench-workload.plar} -t "${pkgdir}/opt/${pkgname}/"

	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/geekbench6" "${pkgdir}/usr/bin/geekbench"
}
