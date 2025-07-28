# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: graysky <graysky AT archlinux dot us>

pkgname='linpack'
_pkgver=2025.2.0_532
_pkgid=861559
pkgver=${_pkgver%%_*}
_math_kernel_lib=${pkgver%%.0}
pkgrel=1
pkgdesc="Benchmark that measures a system's floating-point rate of execution by solving dense linear equations"
arch=('x86_64')
url='https://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download'
license=('LicenseRef-Intel-SmpL-2022')
backup=('etc/linpack.conf')
options=('!strip')
source=("https://downloadmirror.intel.com/${_pkgid}/l_onemklbench_p_${_pkgver}.tgz"
	'linpack.conf'
	'linpack_runme_xeon64')
sha512sums=('299866be93c6ce3cc44841fa073485c16fd3d381e40023e14c52a539fbe7ce61bcc20704751bd242ff81f78f6b555fb88ae296bf98d974b3a85bac62b4d51faf'
            '69b049a3a1c0b674e471bc61e1f88f729db1dd454eb0bfc9adde7c3a4876bb396a91f57f19d5e1add906ee4282068d8cd0fa5f1a59bf8a96784846a3c9f63ab1'
            '3e880d4e0af8154ac1d591177e08ceda28f5ff5fbf698e47f99de8621e37137ecf26024048bd0ee81fc7af73ca8ae0deeb0a309325970a701ac5f13b571bdb60')

package() {
	local _base="${srcdir}/benchmarks_${_math_kernel_lib}"
	local _test="${_base}/linux/share/mkl/benchmarks/linpack"

	install -Dm755 linpack_runme_xeon64 "${pkgdir}/usr/bin/linpack_runme_xeon64"
	install -Dm644 linpack.conf "${pkgdir}/usr/share/${pkgname}/linpack.conf"
	install -Dm644 "${_base}/license.txt" "${pkgdir}/usr/share/licenses/linpack/license.txt"
	install -Dm755 "${_test}/xlinpack_xeon64" "${pkgdir}/usr/bin/xlinpack_xeon64"
}
