# Maintainer: Paul Oppenheimer <bepvte at gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Christian Hesse <mail at eworm.de>
# Contributor: figue <ffigue at gmail.com>
# Contributor: vinibali <vinibali1 at gmail.com>

pkgname=f2fs-tools-git
pkgver=1.12.0
pkgrel=2
pkgdesc='Tools for Flash-Friendly File System (F2FS)'
arch=('x86_64')
url='https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/about/'
depends=('util-linux')
makedepends=('git')
license=('GPL')
validpgpkeys=('D3452A79D8C2B4EAC656F4224014A87E824850D2') # Jaegeuk Kim <jaegeuk@kernel.org>
source=("$pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"

	# /usr/bin/sg_write_buffer is provided in sg3_utils
	sed -i '/sg_write_buffer/d' tools/Makefile.am

	autoreconf -fi
}

build() {
	cd "${pkgname}"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}/" sbindir=/usr/bin install
}
