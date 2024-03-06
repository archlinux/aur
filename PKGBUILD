# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=sled
pkgver=0.12.5
pkgrel=3
pkgdesc="Simple text editor"
arch=('x86_64')
url="https://strahinja.srht.site/sled"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/sled/archive/v$pkgver.tar.gz")
md5sums=('bc71a6663167ddd41d4afabdc255e689')
optdepends=(
	'katex: For math mode'
	'git: For {git-log}'
	'imagemagick: For img tag attributes'
)
checkdepends=(
	'perl'
	'expect'
)

build() {
	# Might need to add --nocheck to makepkg on systems using pacman only
	# for test (Alpine)
	cd $pkgname-v$pkgver

	# Example on how to apply patches: dark theme patch (uncomment last
	# line in this paragraph)
	# Using "git am" instead would require setting up git identity
	#git apply patch/dark-theme.patch

	# Example on how to disable configuration options: turn off wrap
	# (uncomment next line)
	#sed -i 's,^\(#define ENABLE_WRAP\),//\1,' config.h
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e all
}

check() {
	cd $pkgname-v$pkgrel
	make test
}

package() {
	#local redo=$(command -v redo || echo ./do)
	cd $pkgname-v$pkgver
	FALLBACKVER=$pkgver-$pkgrel PREFIX="$pkgdir/usr" make -e install
}
