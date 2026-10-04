# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=amf-amdgpu
pkgver=26.20
_pkgver=26.20
_minor=618
_rhel=10.0
pkgrel=1
pkgdesc="Library files for AMD Advanced Media Framework (RDNA3 and Up Only)"
arch=(x86_64)
url="https://repo.radeon.com/amf"
license=('LicenseRef-AMDGPUPROEULA')
depends=('libstdc++' 'libgcc' 'libdrm' 'glibc' 'python' 'vulkan-radeon')
optdepends=('amf-headers: Header files for development'
	    'rocm-opencl-runtime: ROCm OpenCL integration')
provides=('amf-amdgpu-pro')
conflicts=('amf-amdgpu-pro')
source=("https://repo.radeon.com/amf/${pkgver}/rhel/${_rhel}/packages/main/x86_64/amf-amdgpu-pro-${_pkgver}.${_minor}-1.x86_64.rpm"
	"https://repo.radeon.com/amf/${pkgver}/rhel/${_rhel}/packages/main/x86_64/libamdenc-amdgpu-pro-${_pkgver}.${_minor}-1.x86_64.rpm")
sha256sums=('0041628f9582cc41b49c38cc6c605cdff487b6895395dd9580c1ea6cb25493dd'
            '57cc54707c1db2df0b60b699cc4d25862dcb335ef1d31422faaf795963f9098d')

package() {
	cd "$srcdir/opt/amf/lib64"
	for _file in *.so
	do
		install -Dm755 $_file "${pkgdir}/usr/lib/${_file}"
	done
	install -Dm755 "$srcdir/opt/amf/vcn-check/check_vcn.py" "${pkgdir}/usr/lib/${pkgname}/check_vcn.py"
	install -Dm644 "$srcdir/opt/amf/share/licenses/${pkgname}-pro/AMDGPUPROEULA" "${pkgdir}/usr/share/licenses/${pkgname}/amdgpuproeula.txt"
	sed -i 's/updates\/amdgpu/amdgpu/' "${pkgdir}/usr/lib/${pkgname}/check_vcn.py" #right now, check_vcn.py doesn't work since arch compresses firmware with zst
}
