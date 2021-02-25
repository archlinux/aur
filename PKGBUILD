_pkgname=croco-boot-options
pkgname=${_pkgname}-git
pkgver=r5.466cbc3
pkgrel=1
pkgdesc="A Boot options utility for Croco OS"
arch=('any')
url="https://gitlab.com/croco-os/applications/croco-boot-options"
license=('GPL3')
depends=('qt5-base' 'xdg-utils' 'grub' 'polkit')
optdepends=('plymouth')
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
