# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name='git-prompt.zsh'
pkgname="${_name}-git"
pkgver=1.0.0.r0.g24414df
pkgrel=1
pkgdesc='A fast, pure-shell, single-file Git prompt for Zsh.'
arch=('any')
url="https://github.com/woefe/${_name}"
license=('MIT')
source=("git+${url}.git")
depends=('git')
sha1sums=('SKIP')

pkgver() {
	cd "${_name}"
	( set -o pipefail
		git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
		printf "0.0.%sr%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_name}"
	install -d ${pkgdir}/usr/share/zsh/scripts
	install -m 0644 "${_name}" ${pkgdir}/usr/share/zsh/scripts/
}
