#Maintainer: Carl Malmgren <cral@codegrotto.com>
#Contributor: Julius Schumacher <juliusschumacher at gmail dot com>
pkgname=eterm8
pkgver=1.04
pkgrel=1
pkgdesc="IDE for assembly language programming"
arch=('x86_64')
url="http://www.gbgmv.se/studies.html#machprog"
license=('Copyright 1989-2018, GMV')

depends=('gtk3' 'ncurses' 'libsm' 'libxxf86vm' 'gcc' 'zlib')
makedepends=('libarchive')

source=(http://www.gbgmv.se/dl/linux/$pkgname\_$pkgver\_amd64.deb)
md5sums=('87b8a91b1a11e59aa657fd832b74c22d')
sha256sums=('f6da370469050e9b4986ace2f2573e9236697d218f90d7e799a7bfe307272094')

prepare() {
	echo "Unpacking .deb"
	cd $srcdir
	bsdtar -xf data.tar.xz
}

package() {
	echo "Moving stuff in place"
	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-as" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-as"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-gdb" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-gdb"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-ld" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-ld"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-objcopy" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-objcopy"

	install -Dm755 "$srcdir/usr/share/eterm8/arm-none-eabi-objdump" \
					"$pkgdir/usr/share/eterm8/arm-none-eabi-objdump"

	install -Dm755 "$srcdir/usr/share/eterm8/eterm8" \
					"$pkgdir/usr/share/eterm8/eterm8"

	install -Dm755 "$srcdir/usr/share/eterm8/eterm8.png" \
					"$pkgdir/usr/share/eterm8/eterm8.png"

	install -Dm755 "$srcdir/usr/share/eterm8/md407-ram.x" \
					"$pkgdir/usr/share/eterm8/md407-ram.x"

	install -Dm755 "$srcdir/usr/share/eterm8/simserver" \
					"$pkgdir/usr/share/eterm8/simserver"

	install -Dm755 "$srcdir/usr/share/eterm8/simserver.png" \
					"$pkgdir/usr/share/eterm8/simserver.png"

	install -Dm644 "$srcdir/usr/share/applications/eterm8.desktop" \
					"$pkgdir/usr/share/applications/eterm8.desktop"

	install -Dm644 "$srcdir/usr/share/applications/gdbarm.desktop" \
					"$pkgdir/usr/share/applications/gdbarm.desktop"

	install -Dm644 "$srcdir/usr/share/applications/simserver.desktop" \
					"$pkgdir/usr/share/applications/simserver.desktop"

	install -Dm644 "$srcdir/usr/share/doc/eterm8/changelog.gz" \
					"$pkgdir/usr/share/doc/eterm8/changelog.gz"

	install -Dm644 "$srcdir/usr/share/doc/eterm8/copyright" \
					"$pkgdir/usr/share/doc/eterm8/copyright"

	echo "Creating symlinks"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/share/eterm8/eterm8" "$pkgdir/usr/bin/eterm8"
	ln -s "/usr/share/eterm8/simserver" "$pkgdir/usr/bin/simserver"
	ln -s "/usr/share/eterm8/gdbarm" "$pkgdir/usr/bin/gdbarm"
}

