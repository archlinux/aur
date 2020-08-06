_pkgname=oyster
pkgname=oyster-git
pkgver=r11.68b36bb
pkgrel=1
pkgdesc="A beautiful user interface for mobiles and tablets."
arch=('any')
url="https://gitlab.com/DesQ"
license=('none')
depends=('libdesq-git' 'libdesqui-git' 'pam' 'solid' 'qt5-svg' 'qt5-quickcontrols2' 'libcsys-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('desq-git')
source=("git+https://gitlab.com/Desq/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
