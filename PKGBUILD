# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor demian <mikar ατ gmx δοτ de>
_gitname="awesome-themes"
pkgname="${_gitname}-git"
pkgver=r18.4d7c8f8
pkgrel=1
pkgdesc="Theme Collection for AwesomeWM, updated for 3.5.2. This is the successor of awesome34-themes-git"
arch=('any')
url="https://github.com/serialoverflow/${_gitname}"
license=('GPL')
depends=('awesome')
makedepends=('git')
source=("git+https://github.com/serialoverflow/${_gitname}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
	cd "${_gitname}"
	( set -o pipefail
	  git describe --abbrev=7 --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "${_gitname}"
	
	rm README
	rm -rf "0-screenshots"
}

package() {
	cd "${_gitname}"

	# Create installation directories
	install -d -m755 "${pkgdir}/usr/share/awesome/themes/"

	# Install the themes
	cp -rf * "${pkgdir}/usr/share/awesome/themes/"

	# Keep some scripts functional
	find "$pkgdir" -type f -regex ".*\.sh$" -print0 | xargs -0 chmod 755
}
