# Contributor: Egor Malyutin <egorcod.tk@gmail.com>

pkgname="firefox-quantum"
pkgver=57.0
pkgrel=1
pkgdesc="Meet Firefox Quantum. Fast for good."
arch=('i686' 'x86_64')
url='https://www.mozilla.org/en-US/firefox/'
license=('unknown')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=()
noextract=()
md5sums=()

pkgver() {
	curl "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" | grep -o 'href=".*"' | sed -r 's,href="(.*)",\1,' | sed -r "s,https://download-installer.cdn.mozilla.net/pub/firefox/releases/(.*?)/.*,\1," | grep -oP "^.*?/" | sed 's,/,,'
}


package() {
	cd $pkgdir
	# Create work dirs
	mkdir -p usr usr/{lib,bin}
	cd usr/lib

	# Get latest download link
	link=$(curl "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US" | grep -o 'href=".*"' | sed -r 's,href="(.*)",\1,')
	curl $link >> firefox-quantum.tar.bz2

	# Extract archive
	tar xjvf firefox-quantum.tar.bz2
	rm firefox-quantum.tar.bz2
	mv ./* firefox-quantum

	cd $pkgdir

	# Create link
	ln -sr ./usr/lib/firefox-quantum/firefox ./usr/bin/firefox-quantum
}
