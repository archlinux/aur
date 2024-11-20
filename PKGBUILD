# Maintainer: Talon <diablodev@googlegroups.com>
pkgname=diablo-project-manager
pkgver=git
pkgrel=1
pkgdesc="A CLI Project Manager"
arch=("x86_64")
url="https://gitlab.com/diablodev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager-git")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make PACKAGE="$pkgname" build
}

package() {
	cd "$srcdir/$pkgname"
	make PACKAGE="$pkgname" DESTDIR="$pkgdir" PREFIX="/usr" install
}