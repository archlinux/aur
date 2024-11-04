# Maintainer: Talon Wettstein <diablodev@googlegroups.com>
pkgname=diablo-project-manager-git
pkgver=1
pkgrel=1
pkgdesc="A CLI Project Manager"
arch=("x86_64")
url="https://github.com/diabl0dev/dpm"
license=('MIT')
depends=('bash' 'git' 'glibc')
makedepends=('shc')
provides=("diablo-project-manager")
conflicts=("diablo-project-manager")
source=($pkgname::git+$url)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	chmod +x ./startbuild
	./startbuild
}

package() {
	cd "$srcdir/$pkgname/build"
	chmod +x ./install
	PREFIX="$pkgdir/usr" ./install
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
