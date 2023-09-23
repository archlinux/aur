# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: mrdotx <klassiker@gmx.de>
# Contributor: shulhan <ms@kilabit.info>
# Contributor: Bill Kolokithas <kolokithas.b@gmail.com>

_pkgname=j4-dmenu-desktop
pkgname=j4-dmenu-desktop-git
pkgver=2.18.r99.g7e3fd04
pkgrel=1
pkgdesc='A rewrite of i3-dmenu-desktop, which is much faster'
arch=('i686' 'x86_64')
url='https://github.com/enkore/j4-dmenu-desktop'
license=('GPL3')
makedepends=(
	'git'
	'cmake')
optdepends=(
	'dmenu: the default backend'
	'bemenu: an alternative backend'
)
provides=('j4-dmenu-desktop')
conflicts=('j4-dmenu-desktop')
source=('git+https://github.com/enkore/j4-dmenu-desktop.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DWITH_TESTS=0 -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$_pkgname"
	cmake --install build --prefix="$pkgdir/usr"
	gzip < "$_pkgname.1" > "build/$_pkgname.1.gz"
	install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm0644 "build/$_pkgname.1.gz" -t "$pkgdir/usr/share/man/man1"
}
