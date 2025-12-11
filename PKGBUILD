# Maintainer: Jesse R Codling <jclds139@gmail.com>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Stefano Capitani <stefano@manjaro.org>

_pkgbase=matchama-kde
_pkgname=("plasma6-themes-${_pkgbase%-kde}"{,'-wallpapers'}
	'kvantum-theme-matchama'
	'konsole-colorscheme-matchama'
	'yakuake-skin-matchama'
	'konversation-theme-matchama')
pkgname=("${_pkgname[@]/%/}")
pkgbase=${_pkgbase}
_commit=8525e052971c807d3f6797d7baf38f51c81d4b81
pkgver=r265.8525e05
pkgrel=5
arch=('any')
url="https://gitlab.com/cscs/${_pkgbase}"
license=('GPL3')
makedepends=('git')
options=('!strip')
source=("${pkgbase}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_install() {
	cd "${pkgbase}"
	# shellcheck disable=SC2154
	install -d "${pkgdir}"/usr/share
	cp -r "$@" "${pkgdir}"/usr/share
}

package_plasma6-themes-matchama() {
	pkgdesc="Matcha theme for KDE Plasma 5/6"
	depends=('plasma-workspace')
	optdepends=('papirus-icon-theme: for a more consistent and beautiful experience (recommended)'
		'matcha-gtk-theme: for a consistent look in GTK applications'
		'plasma6-themes-matcha-wallpapers: matcha KDE wallpapers'
		'kvantum-theme-matcha: matcha theme for Kvantum (recommended)'
		'konsole-colorscheme-matcha: matcha theme for Konsole'
		'yakuake-skin-matcha: matcha theme for Yakuake'
		'konversation-theme-matcha: matcha theme for Konversation'
		'matcha-firefox-theme: matcha theme for Firefox')
	provides=("${_pkgbase}")
	conflicts=("${_pkgbase}" 'matcha-kde')
	replaces=('matchama-kde')
	install=${pkgbase}.install

	_install plasma aurorae color-schemes
}

package_plasma6-themes-matchama-wallpapers() {
	pkgdesc="Matcha KDE wallpapers"
	provides=('plasma6-themes-matcha-wallpapers')
	conflicts=('plasma6-themes-matcha-wallpapers')
	replaces=('matchama-kde-wallpapers' 'plasma5-themes-matchama-wallpapers')

	_install wallpapers
}

package_kvantum-theme-matchama() {
	pkgdesc="Matcha theme for Kvantum"
	depends=('kvantum')
	provides=('kvantum-theme-matcha')
	conflicts=('kvantum-theme-matcha')

	_install Kvantum
}

package_konsole-colorscheme-matchama() {
	pkgdesc="Matcha theme for Konsole"
	depends=('konsole')
	provides=('konsole-colorscheme-matcha')
	conflicts=('konsole-colorscheme-matcha')

	_install konsole
}

package_yakuake-skin-matchama() {
	pkgdesc="Matcha theme for Yakuake"
	depends=('yakuake')
	provides=('yakuake-skin-matcha')
	conflicts=('yakuake-skin-matcha')

	_install yakuake
}

package_konversation-theme-matchama() {
	pkgdesc="Matcha theme for Konversation"
	depends=('konversation')
	provides=('konversation-theme-matcha')
	conflicts=('konversation-theme-matcha')

	_install konversation
}
