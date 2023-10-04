# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname_=xgterm
pkgname=$pkgname_-bin
debver=2.1+dfsg-1
pkgver=2.1
pkgrel=1
pkgdesc="X11/GUI utilities and applications for IRAF (xgterm, ximtool, xtapemon)"
arch=("x86_64")
url="https://github.com/iraf-community/x11iraf"
license=("custom")
provides=("$pkgname_")
conflicts=("$pkgname_")
depends=("libxaw" "ncurses" "tcl" "xaw3d")
optdepends=("iraf: to use with irafcl")
source=(https://ftp.debian.org/debian/pool/main/x/x11iraf/${pkgname_}_${debver}_amd64.deb)
sha256sums=("26ab665668e8584fef16bfb68c6ecd264794f01386ec83ddbeb14c8a15aeb206")
# https://packages.debian.org/sid/xgterm

package() {
	cd -- "$srcdir"
	tar xf "data.tar.xz"

	mkdir "usr/share/licenses/$pkgname_" -p
	mv -T "usr/share"/{"doc/$pkgname_/copyright","licenses/$pkgname_/LICENSE"}
	rm -r "usr/share"/{"doc","lintian"} -f
	cp -t "$pkgdir" -a "usr"

	mkdir "$pkgdir/usr/lib" -p
	cd -- "$pkgdir/usr/lib"
	ln -s "libXaw3d.so"{,.6}
}
