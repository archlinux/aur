# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>

pkgname=dots-stable
pkgver=1.2.4
pkgrel=1
pkgdesc="Dotfiles generator that allows quick configuration and managing of different tools and window managers in multiple OSs"
arch=(any)
url="https://github.com/ulises-jeremias/dotfiles"
license=('MIT')
depends=(git)
optdepends=()
provides=(dots)
conflicts=(dots)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd dotfiles
	git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd dotfiles
	git fetch --tags
	latest_release=$(git describe --tags "$(git rev-list --tags --max-count=1)")
	git checkout "${latest_release}"
	PKGNAME=dots
	PKGDIR="${pkgdir}"
	export PKGDIR PKGNAME
	./install
}
