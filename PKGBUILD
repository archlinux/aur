# Maintainer: Joaquín I. Aramendía <samsagax at gmail dot com>

pkgname=gamescope-session-sk-git
_gitdir=gamescope-session
pkgver=0.2.16.r14.g49b0144
pkgrel=1
pkgdesc="Common gamescope session files"
arch=('any')
url="https://github.com/ChimeraOS/gamescope-session"
license=('MIT')
provides=('gamescope-session-git')
conflicts=('gamescope-session-git')
groups=()
depends=('gamescope' 'read-edid')
makedepends=('git')
install=gamescope-session.install
source=("${_gitdir}::git+https://github.com/3003n/${_gitdir}.git#branch=dev")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
	cd "$srcdir/${_gitdir}"
	cp -r ${srcdir}/${_gitdir}/usr ${pkgdir}/usr
	install -Dm644 ${srcdir}/${_gitdir}/LICENSE ${pkgdir}/usr/share/licenses/${_gitdir}/LICENSE
}
