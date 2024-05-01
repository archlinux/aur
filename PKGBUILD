# Maintainer: Alesh Slovak <aleshslovak at gmail dot com>

pkgname=gamescope-session-steam-git
_gitdir=gamescope-session-steam
pkgver=r8.015e098
pkgrel=1
pkgdesc="Steam Big Picture session based on gamescope for ChimeraOS"
arch=('any')
url="https://github.com/ChimeraOS/gamescope-session-steam"
license=('MIT')
groups=()
depends=('gamescope' 'gamescope-session-git')
optdepends=('chimera: for steam-tweaks integration'
            'frzr: chimeraos update system')
makedepends=('git')
source=("${_gitdir}::git+https://github.com/ChimeraOS/${_gitdir}.git")
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
