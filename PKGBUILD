# Maintainer: Eric Biggers <ebiggers3 at gmail dot com>

pkgname=fsverity-utils-git
pkgver=0.0.r50.2151209
pkgrel=1
pkgdesc='A userspace utility for fs-verity'
arch=('x86_64' 'i686')
url='https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git'
license=('GPL')
makedepends=('git')
depends=('openssl')
provides=('fsverity-utils')
source=('git+https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/fsverity-utils"
	printf "0.0.r%d.%s\n" $(git rev-list HEAD --count) \
			      $(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/fsverity-utils"
	make
}

package() {
	cd "${srcdir}/fsverity-utils"
	install -Dm755 fsverity "${pkgdir}/usr/bin/fsverity"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/fsverity-utils/README.md"
}
