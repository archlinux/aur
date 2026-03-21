# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=sled
pkgver=0.20.5
pkgrel=1
pkgdesc="Simple text editor"
arch=('x86_64')
url="https://strahinja.srht.site/sled"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/sled/archive/v$pkgver.tar.gz")
md5sums=('e921d08429740abad1244ef0bc69d2f8')

build() {
	cd "${pkgname}-v$pkgver"
	cp config.$(uname -s) config.mk

	# Example on how to apply patches: syntax patch (uncomment last
	# line in this paragraph); program patch(1) needed
	#patch -p1 < patch/syntax.patch

	# Example on how to set configuration options: turn off wrap
	# (uncomment the next FOUR lines by deleting only the first # on a line)
#	var_to_set='enable_wrap'
#	value_to_set=0
#	sed 's@^\(const [^[:space:]]\{1,\} '"${var_to_set}"'[[:space:]]\{0,\}='\
#'[[:space:]]\{0,\}\)[01]@\1'"${value_to_set}"'@' config.def.h > config.h
# ^---- *Don't* indent the previous line!

	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" all
}

package() {
	cd "${pkgname}-v$pkgver"
	cp config.$(uname -s) config.mk

	make FALLBACKVER="${pkgver}-$pkgrel" DESTDIR="$pkgdir" PREFIX="/usr" \
		install
}
