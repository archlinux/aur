# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=amf-amdgpu
pkgver=26.10.1
_pkgver=26.10
_minor=499
_rhel=10.0
pkgrel=1
pkgdesc="Library files for AMD Advanced Media Framework (RDNA3 and Up Only)"
arch=(x86_64)
url="https://repo.radeon.com/amf"
license=('LicenseRef-AMDGPUPROEULA')
depends=('libstdc++' 'libgcc' 'libdrm' 'glibc' 'python')
optdepends=('amf-headers: Header files for development')
provides=('amf-amdgpu-pro')
conflicts=('amf-amdgpu-pro')
source=("https://repo.radeon.com/amf/${pkgver}/rhel/${_rhel}/packages/main/x86_64/amf-amdgpu-pro-${_pkgver}.${_minor}-1.x86_64.rpm"
	"https://repo.radeon.com/amf/${pkgver}/rhel/${_rhel}/packages/main/x86_64/libamdenc-amdgpu-pro-${_pkgver}.${_minor}-1.x86_64.rpm")
sha256sums=('ba909ce03df2a4ef9f2cdaaca01f83b3ada75cd5cd9d8054ec98bae388845b9e'
            '78ef56510930eebbfd09854b16f18c12fe04b08854dbd567607b040bd7c2a6c5')

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
