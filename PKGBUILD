# Maintainer: Alesh Slovak <aleshslovak at gmail dot com>

pkgname=gamescope-session-steam-sk-git
_gitdir=gamescope-session-steam
pkgver=r11.53d2da9
pkgrel=1
pkgdesc="Steam Big Picture session based on gamescope for ChimeraOS"
arch=('any')
url="https://github.com/3003n/gamescope-session-steam"
license=('MIT')
groups=()
provides=('gamescope-session-steam' 'gamescope-session-steam-git')
depends=('gamescope' 'gamescope-session-git')
optdepends=('chimera: for steam-tweaks integration'
            'frzr: chimeraos update system')
makedepends=('git')
source=("${_gitdir}::git+https://github.com/3003n/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
	cp -rv "${srcdir}/${_gitdir}/usr" "${pkgdir}/usr"
	install -Dm644 "${srcdir}/${_gitdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# font workaround for initial big picture mode startup
	mkdir -p "${pkgdir}/usr/share/fonts/truetype/ttf-dejavu"
	ln -s "/usr/share/fonts/TTF/DejaVuSans.ttf" "${pkgdir}/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf"
}
