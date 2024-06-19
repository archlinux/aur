# Maintainer: Arseni Streltsou <geekmalve[at]gmail[dot]com>
pkgname=lastsimilarious
pkgver=0.1.3
pkgrel=1
pkgdesc="A music streaming player that personalizes your listening experience based on Last.fm's powerful recommendations."
arch=('any')
url="https://github.com/aseni-teso/lastsimilarious"
license=('GPL-3.0-or-later')
depends=('python-requests' 'python-pylast' 'python-beautifulsoup4' 'python-dotenv' 'python-mpv' 'mpv' 'yt-dlp')
makedepends=('base-devel')
provides=('lastsimilarious')
source=("https://github.com/aseni-teso/lastsimilarious/releases/download/0.1.3/LastSimilarious_v0.1.3_release.tar.gz")
sha256sums=('0480efe09d3e766cf9a57211a5bfa7c8421003038db8fe46aac354b828c9a067')

package() {
	cd "$srcdir"

	install -d "$pkgdir/usr/share/$pkgname"
	cp main.py "$pkgdir/usr/share/$pkgname"

	install -Dm755 "$pkgdir/usr/share/$pkgname/main.py" "$pkgdir/usr/bin/$pkgname"
	printf '#!/bin/bash\npython "/usr/share/%s/main.py" "$@"' "$pkgname" > "$pkgdir/usr/bin/$pkgname"
	chmod o+w -R "$pkgdir/usr/share/$pkgname"
}
