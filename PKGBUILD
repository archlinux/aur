# Maintainer: eNV25 <env252525@gmail.com>

pkgname=gcc-go-no-conflicts
pkgver=11.1.0
pkgrel=4
pkgdesc='Go front-end for GCC, does not conflict with go package.'
arch=(x86_64)
url='https://gcc.gnu.org'
license=(GPL LGPL FDL custom)
depends=(gcc)
provides=(gcc-go go gcc-go-multilib)
replaces=(gcc-go gcc-go-multilib)
conflicts=(gcc-go)
options=(!strip)

prepare() {
	curl -L --no-progress-meter https://archlinux.org/packages/core/x86_64/gcc-go/download/ | bsdtar xf -
}

pkgver() {
	local ver="$(awk -v FS=' = ' '/pkgver/ { print $2 }' "${srcdir}/.PKGINFO")"
	echo "${ver%-*}"
}

package() {
	install -Dm755 "${srcdir}/usr/bin/go" "${pkgdir}/usr/bin/gcc-go"
	install -Dm755 "${srcdir}/usr/bin/gofmt" "${pkgdir}/usr/bin/gcc-gofmt"
	install -Dm755 "${srcdir}/usr/bin/gccgo" "${pkgdir}/usr/bin/gccgo"
	install -Dm755 "${srcdir}/usr/bin/x86_64-pc-linux-gnu-gccgo" "${pkgdir}/usr/bin/x86_64-pc-linux-gnu-gccgo"

	cp -prd "${srcdir}/usr/lib/" "${pkgdir}/usr/"
	cp -prd "${srcdir}/usr/lib32/" "${pkgdir}/usr/"
	cp -prd "${srcdir}/usr/share/" "${pkgdir}/usr/"
}
