# Maintainer: Victor Santos <victor_santos@fisica.ufc.br>
pkgname=otf-monego-git
_gitname=monego
pkgdesc='Monaco monospaced font with a bold and italic variant'
pkgver=r16.0c384f8
pkgrel=1
url='https://github.com/cseelus/monego'
arch=('any')
source=("${_gitname}::git+${url}")
sha512sums=(SKIP)
makedepends=('git')
license=('unknown')

pkgver () {
	cd "${_gitname}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${_gitname}"
	local p
	for p in Monego/*.otf ; do
		install -Dm644 "${p}" "${pkgdir}/usr/share/fonts/${_gitname}/${p##*/}"
	done
}