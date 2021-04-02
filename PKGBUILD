# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>

pkgname=nvramtool-corevantage-git
pkgver=4.13.r927fa6d04c
_gitrev=927fa6d04c
pkgrel=1
pkgdesc="Build of nvramtool ensured to be compatible with the Corevantage project"
url="https://www.coreboot.org/Nvramtool"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('nvramtool')
provides=('nvramtool')
source=("git+https://review.coreboot.org/coreboot#commit=${_gitrev}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/coreboot/util/nvramtool"
	make -j`nproc`
}

package() {
	cd "$srcdir/coreboot/util/nvramtool"
	install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
	install -m755 nvramtool "$pkgdir/usr/bin/nvramtool"
	install -m644 cli/nvramtool.8 "$pkgdir/usr/share/man/man8"
}
