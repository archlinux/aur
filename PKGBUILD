# Maintainer: Byeonghoon Yoo <bh322yoo@gmail.com>

_name='history-search-multi-word'

pkgname="zsh-${_name}-git"
pkgver=r315.5b44d8c
pkgrel=1
pkgdesc='Multi-word, syntax highlighted history searching for Zsh'
arch=('any')
license=('MIT')
url='https://github.com/zdharma-continuum/history-search-multi-word'
depends=('zsh>=5.0.0')
makedepends=('git')
source=("${_name}::${url//https/git+https}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_name}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	typeset _plugindir="${pkgdir}/usr/share/zsh/plugins/${_name}"

	cd "${srcdir}/${_name}"

	install -dm0755 "${_plugindir}"
	install -m644 history-search-multi-word* "${_plugindir}"
	install -m644 hsmw-* "${_plugindir}"

	# license
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
