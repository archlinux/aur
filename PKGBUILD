# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=steam-powerbuttond-git
_gitdir=steam-powerbuttond
pkgver=24.04.r20.b5ad0f5
pkgrel=1
pkgdesc="Simple powerbutton daemon for steam with gamescope-session"
arch=('any')
url="https://github.com/ShadowBlip/steam-powerbuttond"
license=('GPL')
groups=()
depends=('python' 'python-evdev')
optdepends=()
makedepends=('git')
source=("${_gitdir}::git+${url}.git")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"

	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m644 steam-powerbuttond.service ${pkgdir}/usr/lib/systemd/system

	mkdir -p ${pkgdir}/usr/local/bin
	install -m755 steam-powerbuttond ${pkgdir}/usr/local/bin
}
