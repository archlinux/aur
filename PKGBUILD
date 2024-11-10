# Maintainer: Talon Wettstein <diablodev@googlegroups.com>
pkgname=diablo-project-manager-git
pkgver=r12.79d210b
pkgrel=1
pkgdesc="A CLI Project Manager"
arch=("x86_64")
url="https://gitlab.com/diablodev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager")
source=($pkgname::git+"https://gitlab.com/diablodev/dpm.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	chmod +x ./startbuild
	./startbuild
}

package() {
	cd "$srcdir/$pkgname/build"
	chmod +x ./install
	PREFIX="$pkgdir/usr" ./install "$pkgname"
}
