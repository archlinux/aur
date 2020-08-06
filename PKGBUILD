_pkgname=Settings
pkgname=desq-settings-git
pkgver=r5.e4aff68
pkgrel=1
pkgdesc="Settings manager for DesQ."
arch=('any')
url="https://gitlab.com/DesQ"
license=('none')
depends=('qt5-base' 'qt5-quickcontrols2')
makedepends=('git' 'cmake')
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
	rm -rf build
    mkdir build && cd build
    cmake .. && make -kj$(nproc)
}

package() {
	cd "$srcdir/${_pkgname}"
	cd build
	make DESTDIR=${pkgdir} install
}
