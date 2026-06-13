# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=2.08
pkgrel=1
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="https://www.gbgmv.se/studies.html"
license=('Copyright 2012-2025, GMV')

makedepends=('libarchive')

source=(http://www.gbgmv.se/dl/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('513b51367522ac2e7c689fc88392d9bc')
sha256sums=('5d9a9c90f4e872c6f85c1e90914164a1c6c695c0c01f977b872026848f88af1d')

prepare() {
	msg2 "Unpacking .deb/data.tar.xz"
	cd $srcdir
	bsdtar -xf data.tar.xz
}

package() {
	depends=(
		'at-spi2-core'
		'brotli'
		'bzip2'
		'cairo'
		'dbus'
		'expat'
		'fontconfig'
		'freetype2'
		'fribidi'
		'gcc-libs'
		'gdk-pixbuf2'
		'glib2'
		'glibc'
		'graphite'
		'gtk3'
		'harfbuzz'
		'icu'
		'jbigkit'
		'json-glib'
		'libcap'
		'libcloudproviders'
		'libdatrie'
		'libepoxy'
		'libffi'
		'libice'
		'libjpeg-turbo'
		'libpng'
		'libsm'
		'libthai'
		'libtiff'
		'pango'
		'pcre2'
		'pixman'
		'sqlite'
		'systemd-libs'
		'util-linux-libs'
		'xz'
		'zlib'
		'zstd'
	)

	optdepends=(
		'libx11'
		'libxau'
		'libxcb'
		'libxcomposite'
		'libxcursor'
		'libxdamage'
		'libxdmcp'
		'libxext'
		'libxfixes'
		'libxi'
		'libxinerama'
		'libxkbcommon'
		'libxml2'
		'libxrandr'
		'libxrender'
		'libxxf86vm'
		'wayland'
	)

	msg2 "Moving stuff in place"
	install -Dm755 "$srcdir/usr/share/digiflisp/digiflisp" \
	               "$pkgdir/usr/share/digiflisp/digiflisp"

	install -Dm755 "$srcdir/usr/share/digiflisp/digiflisp.png" \
	               "$pkgdir/usr/share/digiflisp/digiflisp.png"

	install -Dm755 "$srcdir/usr/share/digiflisp/qaflisp" \
	               "$pkgdir/usr/share/digiflisp/qaflisp"
	
	install -Dm644 "$srcdir/usr/share/applications/digiflisp.desktop" \
	               "$pkgdir/usr/share/applications/digiflisp.desktop"
	
	install -Dm644 "$srcdir/usr/share/doc/digiflisp/changelog.gz" \
	               "$pkgdir/usr/share/doc/digiflisp/changelog.gz"

	install -Dm644 "$srcdir/usr/share/doc/digiflisp/copyright" \
	               "$pkgdir/usr/share/doc/digiflisp/copyright"

	msg2 "Creating symlinks"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/digiflisp/digiflisp" "$pkgdir/usr/bin/digiflisp"
	ln -s "/usr/share/digiflisp/qaflisp"   "$pkgdir/usr/bin/qaflisp"
}
