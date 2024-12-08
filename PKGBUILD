# Maintainer: Talon <diablodev@googlegroups.com>
_pkgname=diablo-project-manager
pkgname=$_pkgname-git
pkgver=git
pkgrel=2
pkgdesc="A Basic Project Manager"
arch=("x86" "x86_64")
url="https://gitlab.com/diablodev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
optdepends=('zenity: allows you to run the diablo-project-manager gui.')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	make clean
}

build() {
	cd "$srcdir/$pkgname"
	make PACKAGE="$_pkgname" PREFIX="/usr" build
}

package() {
	cd "$srcdir/$pkgname"
	make PACKAGE="$_pkgname" DESTDIR="$pkgdir" PREFIX="/usr" install
}
