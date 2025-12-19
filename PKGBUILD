# Maintainer: Yaroslav Veremenko <yaroslav@veremenko.info>
pkgname=retro-fuse-git
pkgver=r102.3269f8d
pkgrel=2
pkgdesc='A FUSE module for accessing ancient Unix filesystems.'
url='https://github.com/jaylogue/retro-fuse'
arch=('x86_64')
license=('Apache-2.0' 'Caldera')
depends=('fuse2' 'glibc')
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
	install -D -t "$pkgdir/usr/share/doc/retro-fuse" README.asciidoc doc/retro-fuse-architecture.png
	install -D -t "$pkgdir/usr/share/licenses/retro-fuse-git/Caldera.pdf" Caldera-license.pdf
}
