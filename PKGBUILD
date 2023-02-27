# Maintainer: éclairevoyant

_pkgname=pacclean
pkgname="$_pkgname-git"
pkgver=r19.d388a9b
pkgrel=1
pkgdesc="Clean up old pacman packages, similar to paccache"
arch=('x86_64')
url="https://github.com/eclairevoyant/pacclean"
license=('CCPL:by-nc-sa')
depends=('pacman' 'glibc')
makedepends=('git' 'nim' 'pandoc')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	nimble release
}

package() {
	cd $pkgname
	install -Dm755 $_pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 $_pkgname.1 -t "$pkgdir/usr/share/man/man1/"
}
