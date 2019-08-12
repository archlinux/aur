 # Maintainer: telans

pkgname=cartographer-git
_pkgname=Cartographer
pkgver=r11.2a2c337
pkgrel=1
pkgdesc="Linux Kernel Module to spoof /proc maps"
arch=('x86_64')
url="https://github.com/LWSS/Cartographer"
license=('GPL')
makedepends=(linux-headers elfutils)
source=('git://github.com/LWSS/Cartographer.git')
md5sums=(SKIP)

install="${pkgname}.install"
_extramodules="$(basename $(readlink -f /lib/modules/$(uname -r)/extramodules/))"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	install -d "$pkgdir/usr/lib/modules/${_extramodules}/"
	install -m644 "$srcdir/$_pkgname/cartographer.ko" \
		"$pkgdir/usr/lib/modules/${_extramodules}/cartographer.ko"
}
