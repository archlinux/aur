# Maintainer: Yaroslav Veremenko <yaroslav@veremenko.info>
pkgname=retro-fuse-git
pkgver=r102.3269f8d
pkgrel=1
pkgdesc='A FUSE module for accessing ancient Unix filesystems.'
url='https://github.com/jaylogue/retro-fuse'
arch=('any')
license=('Apache-2.0' 'Caldera')
depends=('fuse2')
makedepends=('git')
checkdepends=('simh' 'python-pexpect')
source=(
	"${pkgname}::git+https://github.com/jaylogue/retro-fuse.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$pkgname"
    make test
}

build() {
	cd "$pkgname"
	make all
}

package() {
	cd "$pkgname"
	make prefix="$pkgdir/usr" install
    install -D -t "$pkgdir/usr/share/doc/retro-fuse" Caldera-license.pdf LICENSE.txt README.asciidoc doc/retro-fuse-architecture.png
}
