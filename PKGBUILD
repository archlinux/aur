pkgname=xradio-git
pkgver=r103.9d27fae
pkgver() {
	cd "$srcdir/xradio"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Port Allwinner xradio driver to mainline Linux"
arch=(armv7h)
url="https://github.com/fifteenhex/xradio.git"
license=('GPL')
depends=()
makedepends=('git' 'linux-headers')
source=("git+https://github.com/fifteenhex/xradio.git")
md5sums=('SKIP')

_KVER=4.10.4-1-ARCH
#_KVER=$(uname -r)

build() {
	cd "xradio"
	make -C /lib/modules/${_KVER}/build M=$PWD modules
}

package() {
	cd "xradio"
	make -C /lib/modules/${_KVER}/build M=$PWD INSTALL_MOD_PATH="$pkgdir" modules_install
}
