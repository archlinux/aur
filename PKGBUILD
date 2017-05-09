# Maintainer: David Manouchehri
# Contributor: Alex Palaistras <alex+archlinux@deuill.org>

_pkgname=binaryninja
pkgname="${_pkgname}-personal"
_branch=stable
pkgdesc="Binary Ninja is a binary multi-tool and reversing platform"
url="https://binary.ninja"
license=('custom:Binary Ninja License Agreement')
arch=('x86_64')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

# https://binary.ninja/recover/
source=("file://BinaryNinja-personal.zip"
		"binaryninja-personal"
		"binaryninja.png"
		"binaryninja-personal.desktop"
		"libpython2.7.so.1")

# https://binary.ninja/js/hashes.js
sha256sums=('53a72b4d5b1c2de542a19885b799f173c94c9f1902d87326116bdc76063d21f1'
			'6e74aae25261e7a37f9d1982b3604bd201182c69b1985ea5d5c55befb56b476a'
			'ac2e652f617d5ef8aaa34a5113164f51f3f673c872a635d29c93878a00650bf8'
			'36aea5c3f72563703b937b98381195de01084fcddacd6e4a3ed4bc48ae75c9a2'
			'SKIP')

# @TODO: Figure out what's really needed.
depends=('libcurl-compat')
makedepends=('git')
pkgver=1.0.320
pkgrel=1

# pkgver() {
# 	# @TODO: Use https://binary.ninja/js/changelog.js and
# 	# https://binary.ninja/js/hashes.js to bump the version automatically. 
# }

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/bin"

	mv "${srcdir}/binaryninja" "${pkgdir}/opt/binaryninja-personal"

	install -m644 "${srcdir}/binaryninja.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -m644 "${srcdir}/binaryninja-personal.desktop" "${pkgdir}/usr/share/applications/"
	install -m755 "${srcdir}/binaryninja-personal" "${pkgdir}/usr/bin"

	mv "${srcdir}/libpython2.7.so.1" "${pkgdir}/opt/binaryninja-personal/plugins/libpython2.7.so.1"
	# ln -s "/usr/lib/libpython2.7.so" "${pkgdir}"/opt/binaryninja-personal/libpython2.7.so.1
}

# vim:set et sw=2 sts=2 tw=80:
