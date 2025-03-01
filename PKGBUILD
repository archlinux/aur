pkgname=dpw
pkgver=1.1.0
pkgrel=1
pkgdesc='Declarative Pacman Wrapper'
arch=(any)
optdepends=(
	'paru: recommended pacman wrapper'
	'aura: pacman wrapper'
	'aurman: pacman wrapper'
	'pacaur: pacman wrapper'
	'pikaur: pacman wrapper'
	'yay: pacman wrapper'
)
license=(GPL-3.0-or-later)
source=(${pkgname}-git::git+https://github.com/tiagoporsch/dpw.git#tag=v1.1.0)
sha256sums=('SKIP')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${pkgname}-git/dpw" "${pkgdir}/usr/bin/dpw"
	chmod +x "${pkgdir}/usr/bin/dpw"

	# Add fish completions if fish shell is installed
	if [ -x "$(command -v fish)" ]; then
		if [ -d "/usr/share/fish/vendor_completions.d" ]; then	
			mkdir -p "/usr/share/fish/vendor_completions.d"
		fi

		sudo cp "${srcdir}/${pkgname}-git/dpw.fish" "/usr/share/fish/vendor_completions.d/dpw.fish"
	fi
}
