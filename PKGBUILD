# Maintainer: HunarPG <HunarSangwanPG@gmail.com>
pkgname='porymap-git'
pkgver=5.2.0.r14.g3d3811f
pkgrel=1
pkgdesc="A map editor for the Pokémon generation 3 decompilation projects"
arch=('x86_64')
url="https://github.com/huderlem/porymap"
license=('LGPL')
depends=('make' 'git' 'qt5-base' 'qt5-declarative' 'libglvnd' 'gcc-libs' 'glibc' 'libpng' 'zlib' 'harfbuzz' 'md4c' 'krb5' 'libproxy' 'openssl' 'systemd-libs' 
         'double-conversion' 'icu' 'pcre2' 'zstd' 'glib2' 'freetype2' 'graphite' 'e2fsprogs' 'keyutils' 'libcap' 'libgcrypt' 'lz4' 'xz' 'libx11' 'bzip2' 
		 'brotli' 'curl' 'duktape' 'libffi' 'libgpg-error' 'libxcb' 'libnghttp2' 'libidn2' 'libssh2' 'libpsl' 'util-linux-libs' 'libxau' 'libxdmcp' 'libunistring' 
		 'gendesk' 'libicns')
source=("git+$url")
md5sums=('SKIP')

prepare() {
    cd "porymap"
	wget https://raw.githubusercontent.com/huderlem/porymap/master/resources/icons/porymap-icon-2.ico
	icotool -x porymap-icon-2.ico
	gendesk --pkgname "porymap" --pkgdesc "$pkgdesc" --icon "porymap-icon-2_1_64x64x32.png"
	export CXXFLAGS="-Wno-error"
}

pkgver() {
  cd "porymap"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "porymap"
	qmake 
	make
}

package() {
	cd "porymap"
	install -Dm755 ./porymap "$pkgdir/usr/bin/porymap"
	install -Dm644 "porymap.desktop" "$pkgdir/usr/share/applications/porymap.desktop"
	install -Dm644 "porymap-icon-2_1_64x64x32.png" "$pkgdir/usr/share/pixmaps/porymap-icon-2_1_64x64x32.png"
}
