# Maintainer: Nikhil Singh <nik.singh710@gmail.com>
pkgname=center-align
pkgver=r1.f6fce9f
pkgrel=1
pkgdesc="Simple utility to align the stdout text (horizontal+vertical) Middle"
arch=("x86_64")
url="https://github.com/niksingh710/center-align"
license=('WTFPL')
makedepends=("git")
optdepends=("figlet: for nice text art")
source=("git+https://github.com/niksingh710/center-align.git")
md5sums=('SKIP')
provides=('center-align')
conflicts=('center-align')

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "$pkgname"
	install -Dm755 ./center "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./Readme.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
