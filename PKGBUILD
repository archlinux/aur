pkgname=rlshim-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite. (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'gcc-libs' 'glibc' 'java-runtime>=11')
provides=('rlshim')
conflicts=('rlshim')
source_x86_64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-x86_64-gnu.tar.gz")
source_aarch64=("https://github.com/RdrSeraphim/rlshim/releases/download/v$pkgver/rlshim-$pkgver-aarch64-gnu.tar.gz")
sha256sums_x86_64=('7aa065ba0951c1fd2696ecb13c74d3fa161d0adbed51bdce64f6f703308f5a49')
sha256sums_aarch64=('cd75f6a797d1af68f96ef845e8fd58b3e43ab4b5b13ef48c8029411c7f1f226e')

package() {
	if [[ "$CARCH" == "x86_64" ]]; then
		cd "rlshim-$pkgver-x86_64-gnu"
	elif [[ "$CARCH" == "aarch64" ]]; then
		cd "rlshim-$pkgver-aarch64-gnu"
	fi

	install -Dm755 bin/rlshim "$pkgdir/usr/bin/rlshim"
	install -Dm644 share/applications/rlshim.desktop "$pkgdir/usr/share/applications/rlshim.desktop"
	install -Dm644 share/pixmaps/rlshim.png "$pkgdir/usr/share/pixmaps/rlshim.png"

	mkdir -p "$pkgdir/usr/share/rlshim"
	cp -r share/rlshim/* "$pkgdir/usr/share/rlshim/"
}
