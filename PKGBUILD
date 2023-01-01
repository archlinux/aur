# Maintainer: aksr <aksr at t-com dot me>
pkgname=dwb-belllabs-git
pkgver=20150517.r59.g562bb86
pkgrel=1
pkgdesc="A fork of the original Documenter's Workbench Release 3.3."
arch=('i686' 'x86_64')
url="https://github.com/n-t-roff/DWB3.3"
license=('EPL')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/n-t-roff/DWB3.3.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	./configure
	make -j1
}

package() {
	cd "$srcdir/$pkgname"
	_prefix="opt/dwb" # "usr/" changed to "opt/" to avoid conflicts
	make -j1 -f dwb.mk ROOT="$pkgdir/" \
		BINDIR="$pkgdir/$_prefix/bin" \
		FONTDIR="$pkgdir/$_prefix/lib/font" \
		HOSTDIR="$pkgdir/$_prefix/lib/font/postscript" \
		POSTLIB="$pkgdir/$_prefix/lib/postscript" \
		LIBDIR="$pkgdir/$_prefix/lib/dwb" \
		MACRODIR="$pkgdir/$_prefix/lib/macros" \
		MAN1DIR="$pkgdir/$_prefix/man/man1" \
		MAN5DIR="$pkgdir/$_prefix/man/man5" \
		NTERMDIR="$pkgdir/$_prefix/lib/nterm" \
		POSTBIN="$pkgdir/$_prefix/bin/postscript" \
		POSTLIB="$pkgdir/$_prefix/lib/postscript" \
		PUBDIR="$pkgdir/$_prefix/pub" \
		RASTDIR="$pkgdir/$_prefix/lib/raster" \
		TMACDIR="$pkgdir/$_prefix/lib/tmac" install
}
