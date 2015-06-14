# Maintainer: Andreas B. Wagner <andreas.wagner@lowfatcomputing.org>
_pkgname=xdotool
pkgname=${_pkgname}-git
pkgver=0.r512.f5309ec
pkgrel=1
pkgdesc="Command-line X11 automation tool"
arch=('i686' 'x86_64')
url="http://www.semicomplete.com/projects/xdotool"
license=('BSD')
depends=('libxkbcommon' 'libxinerama' 'libxtst')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=(${_pkgname}-svn)
source=("$pkgname::git+https://github.com/jordansissel/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	find $srcdir/$pkgname -type f -exec sed -i 's/\r//g' {} \;
}

build() {
	cd "$srcdir/$pkgname"
	export PATH=$PATH:/usr/bin/core_perl/ make PREFIX="$pkgdir/usr" INSTALLMAN="$pkgdir/usr/share/man"
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="$pkgdir/usr" INSTALLMAN="$pkgdir/usr/share/man" install
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$_pkgname/COPYRIGHT"
} 
