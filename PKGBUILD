# Maintainer: nezu <nezu@nezu.cc>

_target=riscv-none-elf
_pkgname="$_target-gcc"
pkgname="$_pkgname-ch56x-bin"
_relver="12.2.0-1"
pkgver=12.2.0_2
pkgrel=1
pkgdesc='Cross compiler for RISC-V (xPack, with support of WCH RISCV CH56x, hydrausb3 fork)'
arch=('x86_64')
url='https://github.com/hydrausb3/riscv-none-elf-gcc-xpack'
license=('GPL' 'LGPL')
depends=("libmpc")
provides=("xpack-${_pkgname}"
          "${_target}-gdb" "${_target}-binutils" "${_target}-newlib")
conflicts=("xpack-${_pkgname}")
options=('!emptydirs' '!strip')
source_x86_64=("${url}/releases/download/${_relver}/xpack-${_pkgname}-${pkgver//_/-}-linux-x64.tar.gz")
sha256sums_x86_64=('f67a957765c876a405cb9a4a88ae700b9eb6770c6195b1c32003a31b3c50bb97')

package() {
	install -dm755 ${pkgdir}/opt/xpack/${_pkgname}

	cp -a ${srcdir}/xpack-${_pkgname}-${_relver}/* ${pkgdir}/opt/xpack/${_pkgname}/

	install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${_pkgname}.sh" << EOF
#!/bin/sh
[ -d /opt/xpack/${_pkgname}/bin ] && append_path '/opt/xpack/${_pkgname}/bin'

export PATH
EOF
}
