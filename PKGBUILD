# Maintainer: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

pkgname=populatefs
pkgver=r11.95cc98b
pkgrel=2
pkgdesc="Tool for replacing genext2fs when creating ext4 images"
arch=(x86_64)
url="https://github.com/oskarirauta/populatefs"
license=('GPL')
depends=('e2fsprogs')
makedepends=('git')
source=("git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${pkgname}
	make EXTRA_CFLAGS="-fPIC -DHAVE_GETOPT_H=1"
}

package() {
	cd ${pkgname}
	make DESTDIR="$pkgdir/" install
}
