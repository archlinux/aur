# Maintainer: Integral <integral@murena.io>

pkgname=geekbench-preview
pkgver=6.2.1
pkgrel=1
pkgdesc="A cross-platform benchmark that measures processor and memory performance (Preview Version)"
arch=('aarch64' 'riscv64')
url="https://www.geekbench.com/"
depends=('zlib' 'gcc-libs')
license=("custom")
source_aarch64=("https://cdn.geekbench.com/Geekbench-${pkgver}-LinuxARMPreview.tar.gz")
source_riscv64=("https://cdn.geekbench.com/Geekbench-${pkgver}-LinuxRISCVPreview.tar.gz")
sha512sums_aarch64=('387b1207cb06bbb305fcd7e1c6bb03ed0ec0bd707284f9b71fb570e12ffe6014dd3f9afa9019046301423a022c4803ec159c8bfbe9342e1171e11b18ff33a175')
sha512sums_riscv64=('12452aa4032da006b3b8009491f6e210bb8e214c9945029c74bca9f43debf7eb3fc226bf181f764f7620c7368f25aba36dd7253f46a59dd8d7ee6f9f288036b3')
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
