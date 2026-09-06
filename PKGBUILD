pkgname=smb-post
pkgver=0.1.0.r5.147f86b
pkgrel=1
pkgdesc="Minimalistischer, tastaturgesteuerter Serienbrief-Verteiler für Unix-Systeme"
url="https://codeberg.org/Sergius/smb-post"
arch=(any)
license=(MIT)
depends=(bash rofi jq libnotify)
optdepends=('msmtp: Mail-Backend'
            'sendmail: Mail-Backend')
source=("git+https://codeberg.org/Sergius/smb-post.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	: # No build step required
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
