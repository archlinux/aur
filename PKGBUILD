# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

pkgname=necroedit
pkgver=0.11
pkgrel=1
pkgdesc='External level edit for Crypt of the Necrodancer'
arch=('x86_64')
url='https://github.com/Marukyu/NecroEdit'
license=('MIT')
makedepends=('gcc' 'cmake')
depends=()
provides=('necroedit')
conflicts=('necroedit')
source=('https://github.com/Marukyu/NecroEdit/archive/v0.11.tar.gz'
        'necroedit')
sha256sums=('5dcdcc45da43b4a2da1576e38095781f6d774c008c908b8f34927a1e33e0054d'
            '275de615fb6b4494972f5c11de44bd199f546a6d7d9271cd5c3b42e871d3c04e')

build() {
	cd "$srcdir/NecroEdit-$pkgver"

	cmake .
	make
}

package() {
	install -D -m755 "$srcdir/necroedit" "$pkgdir/usr/bin/necroedit"
	install -D -m755 "$srcdir/NecroEdit-$pkgver/bin/NecroEdit" "$pkgdir/usr/lib/necroedit/NecroEdit"

	for file in "$srcdir/NecroEdit-$pkgver/res/"*; do
		install -D -m644 "$file" "$pkgdir/usr/share/necroedit/${file##*/}"
	done

	game_directory="$HOME/.steam/steam/steamapps/common/Crypt of the NecroDancer"
	game_location_file="/usr/share/necroedit/game-directory.txt"
	echo "$game_directory" > "$pkgdir/$game_location_file"

	echo "The game directory is assumed to be '$game_directory'."
	echo "If this isn't true, please edit '$game_location_file' with the correct path."
}

# vim: set noet:
