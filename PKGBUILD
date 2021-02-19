# Maintainer: Jonathon Fernyhough <jonathon+m2x+dev>
pkgname=otf-solbera-dnd-5e-git
_gitname=solbera-dnd-fonts
pkgver=r7.5106cf8
pkgrel=1
license=('Custom: CC-BY-SA-4.0')
makedepends=('git')
pkgdesc='A collection of unrestricted DND5e-compatible typefaces'
arch=('any')
provides=(
	'otf-bookinsanity'
	'otf-dungeon-drop-case'
	'otf-mr-eaves'
	'otf-nodesto-caps-condensed'
	'otf-scaly-sans'
	'otf-scaly-sans-caps'
	'otf-solbera-imitation'
	'otf-zatanna-misdirection'
)
conflicts=("${pkgname%%-git}")
url="https://github.com/jonathonf/${_gitname}"
source=("git+$url.git")
sha256sums=('SKIP')
_fontnames=(
	'Bookinsanity'
	'Dungeon Drop Case'
	'Mr Eaves'
	'Nodesto Caps Condensed'
	'Scaly Sans'
	'Solbera Imitation'
	'Zatanna Misdirection'
)

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_gitname}"
	find . -iname '*.otf' -execdir install -Dm 644 {} "${pkgdir}"/usr/share/fonts/OTF/{} \;
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
