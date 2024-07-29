# Maintainer: Chenx Dust <chenx_dust@outlook.com>

pkgname=steam-gamepadui-session-git
_gitown=chenx-dust
_gitdir=steam-gamepadui-session
pkgver=r17.fabfbd9
pkgrel=1
pkgdesc="Steam Big Picture session based on gamescope for vanilla Arch Linux"
arch=('any')
url="https://github.com/${_gitown}/${_gitdir}"
license=('MIT')
groups=()
depends=('steam' 'gamescope' 'gamescope-session-git')
optdepends=(
	'ttf-dejavu: for initial screen text'
	'steam_notif_daemon: notify daemon'
	'ibus: input support'
	'steam-removable-media-git: removable media support'
	'gamemode: for performance tuning'
	'lib32-gamemode: for performance tuning'
)
conflicts=('gamescope-session-steam-git')
makedepends=('git')
source=("${_gitdir}::git+https://github.com/${_gitown}/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
	cp -rv "${srcdir}/${_gitdir}/usr" "${pkgdir}/usr"
	cp -rv "${srcdir}/${_gitdir}/etc" "${pkgdir}/etc"
	install -Dm644 "${srcdir}/${_gitdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# font workaround for initial big picture mode startup
	mkdir -p "${pkgdir}/usr/share/fonts/truetype/ttf-dejavu"
	ln -s "/usr/share/fonts/TTF/DejaVuSans.ttf" "${pkgdir}/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf"
}

