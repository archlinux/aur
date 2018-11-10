# Maintainer: Roxxers <me@roxxers.xyz>
pkgname=youtube-tv-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Youtube TV app for desktop"
arch=('i686' 'x86_64')
url="https://youtube.com/tv"
license=('unknown')
depends=('alsa-lib' 'gtk3' 'libxss' 'libxtst' 'nss')
makedepends=('nodejs-nativefier')
provides=('youtube-tv-desktop')
source=('youtube-tv-desktop.png'
        'youtube-tv-desktop.desktop'
	'youtube-tv-desktop.sh')

build() {
	cd $srcdir

	nativefier "https://youtube.com/tv" \
		--name "youtube-tv" \
		--disable-context-menu \
		--disable-dev-tools \
		--width 700px \
		--height 700px \
		-i "../$pkgname.png"

	rm -rf youtube-tv
	mv youtube-tv-*/ youtube-tv
}

package() {
	install -dm755 "$pkgdir/opt/youtube-tv"
	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/pixmaps/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp -R "$srcdir/youtube-tv/." "$pkgdir/opt/youtube-tv/"
	chmod 755 "$pkgdir/opt/youtube-tv/resources/app"

	install -Dm755 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/youtube-tv.png"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
md5sums=('0d7a6391da8564eb1507c323822433c0'
         'dadc1766a52f86047432ac4cc59816e5'
         'afd7bf324e0108aa6091181b85b4db10')
