# Maintainer: Joakim Hulthe <joakim@hulthe.net>
pkgname=digiflisp
pkgver=2.06
pkgrel=2
pkgdesc="IDE for the FLIS processor and training computer"
arch=('x86_64')
url="https://www.gbgmv.se/studies.html"
license=('Copyright 2012-2024, GMV')

makedepends=('libarchive')

source=(http://www.gbgmv.se/dl/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('3216344c32306c2da1c6c51b7298a9c2')
sha256sums=('39f2a79a43239339e27c1b91a8f1d5333a89c0029e447ee5137040a8db360e5d')

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
		'libjpeg6-turbo'
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
