# Maintainer: Roddy Rappaport <roddy.rappaport@gmail.com>

pkgname=gdb-static-bin
pkgver=18.1
pkgrel=1

provides=("gdb-static")

pkgdesc="Precompiled binaries of a statically linked versions of GDB with python. From the source repository's releases tab."
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/guyush1/gdb-static'
license=('GPL-3.0-or-later')

options=(!debug !strip)

source_x86_64=("https://github.com/guyush1/gdb-static/releases/download/v${pkgver}-static/gdb-static-full-x86_64.tar.gz")
sha256sums_x86_64=("6691734087a7523c2706ddf4026ea0ce565fc519a9306d2e4e5642a22705a188")

source_aarch64=("https://github.com/guyush1/gdb-static/releases/download/v${pkgver}-static/gdb-static-full-aarch64.tar.gz")
sha256sums_aarch64=("58b4f94c16e3d51d595ae497fbdb1b8bd43083487da9a2121313beae4fe22045")

source_armv7h=("https://github.com/guyush1/gdb-static/releases/download/v${pkgver}-static/gdb-static-full-arm.tar.gz")
sha256sums_armv7h=("f85bb9496279dfce5ff36c246340dba074b4e9cc00ecf1b3092aef0252b38713")

package() {
	local out_bin_dir="${pkgdir}/usr/bin/"
	mkdir -p "${out_bin_dir}"

	local out_licenses_dir="${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${out_licenses_dir}"

	cp "${srcdir}/NOTICES" "${out_licenses_dir}/"

	# Manually add a custom "-static" suffix so the binaries won't conflice with gdb. Additionally
	# only take gdb and gdb-server (There are some binaries that aren't really related to gdb, so
	# taking all of them seems wasteful. If anybody want them they can be added later).
	for filename in "gdb" "gdbserver"; do
		cp "${srcdir}/${filename}" "${out_bin_dir}/${filename}-static"
	done
}

