# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
_pkgname=ly
pkgname="$_pkgname"-git
pkgver=0.5.3.r89.gc64f806
pkgrel=1
pkgdesc="TUI display manager"
arch=(i686 x86_64 aarch64)
url="https://github.com/fairyglade/$_pkgname"
license=('custom:WTFPL')
depends=(pam)
makedepends=(git libxcb)
optdepends=('xorg-xauth: for X server sessions')
conflicts=(ly python-ly)
provides=(ly)
backup=(etc/"$_pkgname"/{config.ini,wsetup.sh,xsetup.sh})
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd ly
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ly
  git submodule update --init --recursive
}

build() {
	cd ly
	make
}

package() {
	cd ly
	make DESTDIR="$pkgdir" install installsystemd
	install -D -m644 license.md "${pkgdir}/usr/share/licenses/${pkgname}/WTFPL"
}
