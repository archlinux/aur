# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>
pkgname=xs-git
pkgver=r1849.789540c
pkgrel=1
pkgdesc="An extensible shell descended from es and rc. (GIT version)"
arch=('x86_64' 'i686')
url="https://github.com/TieDyedDevil/XS"
license=('custom')
depends=('boost' 'libffi' 'gc')
makedepends=('git' 'meson' 'ninja')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+$url")
md5sums=('SKIP')
install=xs.install

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$pkgname
	meson --prefix /usr --buildtype release build
	ninja -C build
}

package() {
	cd $srcdir/$pkgname
	install -D -m644 "doc/COPYING" "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"
	DESTDIR=$pkgdir ninja -C build install
}
