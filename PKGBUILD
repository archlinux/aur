# Maintainer: Adrián Romero <adriik.linux@proton.me>
pkgname=zathura-pywal-git
_pkgname=zathura-pywal
pkgver=r25.e9973b8
pkgrel=1
pkgdesc="Scripts that dynamically theme zathura based on colors set by pywal."
arch=(any)
url="https://github.com/GideonWolfe/Zathura-Pywal"
license=('unknown')
depends=('zathura' 'python-pywal')
makedepends=('git')
source=("$_pkgname::git+https://github.com/GideonWolfe/Zathura-Pywal.git")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i '/PATH/d' zathura
}

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm 755 genzathurarc "$pkgdir/usr/bin/genzathurarc"
	install -Dm 755 zathura "$pkgdir/usr/bin/$_pkgname"
}
