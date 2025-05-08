# Maintainer: apropos <jj@toki.la>
# Contributor: David Manouchehri
# Contributor: Alex Palaistras <alex+archlinux@deuill.org>
# Contributor: Elen Eisendle
# Contributor: Spenser Reinhardt

pkgname=binaryninja-personal
_pkgname=binaryninja
pkgver=5.0.7290
pkgrel=1
pkgdesc="An interactive decompiler, disassembler, debugger, and binary analysis platform. This package is for the Personal Edition and requires both an installer zip (x86 or ARM) and a license."
arch=('x86_64' 'arm')
url="https://binary.ninja"
license=('custom:Binary Ninja License Agreement')
depends=(
	'python' 'glibc' 'glib2' 'gcc-libs-multilib' 'pcre' 'zlib'
	'libssh2' 'libnghttp2' 'libpsl' 'libxcb' 'icu' 'keyutils'
	'libxext' 'libx11' 'libglvnd' 'krb5' 'e2fsprogs' 'libffi'
	'libxau' 'libxdmcp' 'libcurl-compat' 'openssl' 'qt5-base'
)
optdepends=('gtk-update-icon-cache: icon support')
provides=(binaryninja)
source=(
	"file://binaryninja_personal_linux.zip" # https://binary.ninja/recover/
	"${_pkgname}.png"
	"${_pkgname}.desktop"
)
sha256sums=('SKIP' 
            '4f318001e7d39279ce063ef42077bae03e95c112aa203a4be3ea3d913c34327e'
            'a1e20e8176292c67fcc50d3444e95e31ee91ff6cf861f8529554152ed7bd8139')

pkgver() {
	curl -s "https://binary.ninja/js/changelog.js" | perl -pe 's/.*?version":\s"(\d+\.\d+\.\d+)".*/$1/'
}

package() {
	mkdir "${pkgdir}/opt"
	install -d "${pkgdir}"/usr/share/{icons,applications}

	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
	install -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/"
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
