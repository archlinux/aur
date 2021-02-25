_pkgname=croco-boot-repair
pkgname=${_pkgname}-git
pkgver=r7.a128fab
pkgrel=1
pkgdesc="A Grub repair utility for Croco OS"
arch=('any')
url="https://gitlab.com/croco-os/applications/croco-boot-repair"
license=('GPL3')
depends=('qt5-base' 'xdg-utils' 'grub' 'polkit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('croco-git')
source=("git+https://gitlab.com/croco-os/applications/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake-qt5 ${_pkgname}.pro
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
