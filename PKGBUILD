# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=sled
pkgver=0.13.1
pkgrel=1
pkgdesc="Simple text editor"
arch=('x86_64')
url="https://strahinja.srht.site/sled"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/sled/archive/v$pkgver.tar.gz")
md5sums=('fdc7ec958a5a7595a7728fc664ba8ae8')

build() {
	cd "${pkgname}-v$pkgver"

	# Example on how to apply patches: dark theme patch (uncomment last
	# line in this paragraph)
	# Using "git am" instead would require setting up git identity
	#git apply patch/dark-theme.patch

	# Example on how to disable configuration options: turn off wrap
	# (uncomment next line)
	#sed -i 's,^\(#define ENABLE_WRAP\),//\1,' config.h

	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" all
}

package() {
	cd "${pkgname}-v$pkgver"
	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" \
		install
}
