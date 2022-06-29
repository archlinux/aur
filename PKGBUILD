# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <hritwiksinghal@pm.me>
pkgname=bing-wall
pkgver=2.4
pkgrel=0.0
# epoch=
pkgdesc="Bing wallpaper of the day application for Gnome desktop"
arch=('x86_64' 'i686')
url="https://github.com/keshavbhatt/BingWall"
license=('MIT')
# groups=()
depends=()
makedepends=('qt5-base' 'qt6-base' 'make' 'git')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# changelog=
install=
source=("git+$url")
# noextract=()
md5sums=("SKIP")
# validpgpkeys=()

# prepare() {
	# cd "$pkgname-$pkgver"
	# patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

build() {
	# cd "$pkgname-$pkgver"
	# ./configure --prefix=/usr
    cd BingWall/src
	qmake
	make -j$(nproc --all)

}

# check() {
	# cd "$pkgname-$pkgver"
	# make -k check
# }

package() {
	cd BingWall/src

    mkdir -p "${pkgdir}/usr/local/bin"
	install -Dm0755 "bing-wall" "${pkgdir}/usr/local/bin"
	chmod +x "$pkgdir/usr/local/bin/bing-wall"

	mkdir -p "${pkgdir}/usr/share/applications/"
	install -Dm0644 "bingwall.desktop" "${pkgdir}/usr/share/applications/"

	cd ..
	mkdir -p "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
