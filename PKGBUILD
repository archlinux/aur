# Maintainer: Totchi Lagawi <chatnoir420 at gmx dot com>
pkgname=wit-bin
pkgver=3.05a
pkgrel=1
_archive=wit-v3.05a-r8638-x86_64
pkgdesc="Wiimms ISO Tools is a set of command line tools to manipulate Wii and GameCube ISO images and WBFS containers."
arch=(x86_64)
url="https://wit.wiimm.de/"
license=('GPL-2.0')
depends=(bzip2 fuse2 glibc libncursesw.so openssl zlib)
makedepends=()
optdepends=(
	'bash: Update title list'
	'wget: Update title list'
)
conflicts=(wit-git)
source=("https://wit.wiimm.de/download/$_archive.tar.gz")
sha256sums=('df95a14f1b4b2bd95d3111b70c6304e91d4ed3e4c7f72b1ad5306c3616d8933f')

prepare() {
	cd "$srcdir/$_archive"
	sed -i 's/usr\/local/usr/' load-titles.sh
	sed -i 's/http/https/' load-titles.sh
	sed -i 's/\.\/share/\/tmp/' load-titles.sh
}

package() {
	cd "$srcdir/$_archive"
	install -Dm755 -t $pkgdir/usr/bin bin/*
	ln -sf $pkgdir/usr/bin/wdf $pkgdir/usr/bin/wdf-cat
	ln -sf $pkgdir/usr/bin/wdf $pkgdir/usr/bin/wdf-dump
	install -Dm644 -t $pkgdir/usr/share/wit share/*
	install -Dm755 load-titles.sh $pkgdir/usr/share/wit/load-titles.sh
	install -Dm644 -t $pkgdir/usr/share/doc/wit doc/*
}
