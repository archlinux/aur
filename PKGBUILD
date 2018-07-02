# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=otf-monacob-git
pkgdesc='Monaco font with a bold variant'
pkgver=r9.b77db4b
pkgrel=1
url='https://github.com/vjpr/monaco-bold'
arch=(any)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"
	local p
	for p in */*.otf ; do
		install -Dm644 "${p}" "${pkgdir}/usr/share/fonts/${pkgname}/${p##*/}"
	done
}
