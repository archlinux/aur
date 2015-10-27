_name="smarttabs"
_reponame="vim-${_name}"
pkgname="${_reponame}-git"
pkgver=r4.9de63c0
pkgrel=1
pkgdesc="VIM plugin that implements smart tabs"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=231"
license=('unknown')
depends=('vim')
makedepends=('git')
source=("git+https://github.com/dpc/${_reponame}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_reponame}/plugin"
	install -Dm 644 ${_name}.vim "${pkgdir}/usr/share/vim/vim74/plugin/${_name}.vim"
}
