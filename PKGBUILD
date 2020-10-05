# Maintainer: Mees Luten <mees [dot] luten [at] gmail [dot] com>
pkgname=libccsds-git
pkgver=r5.81a0c5e
pkgrel=1
pkgdesc="A library to handle several CCSDS routines"
arch=('x86_64')
url="https://github.com/altillimity/libccsds"
license=('GPLv3')
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
source=("$pkgname"::'git+https://github.com/altillimity/libccsds.git')
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	#rm -f -r $pkgname
	#mv $pkgname-master $pkgname
	mkdir -p "$pkgname"/build
}

build() {
	cd "$pkgname"/build
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr/local ..
}

package() {
	cd "$pkgname"/build
	make install
}
