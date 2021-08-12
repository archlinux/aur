# Maintainer: Your Name <Amazingminecrafter2015@gmail.com>
pkgname=ion-shell-git
_tag=ion
pkgver=r2133.df993477
pkgrel=2
pkgdesc="a modern system shell that features a simple, yet powerful, syntax."
arch=("x86_64" "i686" )
url="https://gitlab.redox-os.org/redox-os/ion/"
license=('MIT')
makedepends=("rust" "git")
depends=("gcc-libs")
provides=("$_tag")
conflicts=("$_tag")
source=("git+https://gitlab.redox-os.org/redox-os/ion/")
install=${_tag}.install
sha256sums=('SKIP')

pkgver() {
  cd "${_tag}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	echo "If build fails run: rustup toolchain install stable && rustup default stable"
	cd "./${_tag}"
	RUSTUP=0 make
}

package() {
	cd "./${_tag}"
	make install prefix="${pkgdir}/usr"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${_tag}/LICENSE"
}
