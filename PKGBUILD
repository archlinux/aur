# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=easyepg-lite-git
pkgver=r18.0ae7fe6
pkgrel=1
pkgdesc="XMLTV grabber tool using Gracenote's TMS API"
url="https://github.com/sunsettrack4/script.service.easyepg-lite"
depends=(
	python
	python-bottle
	python-requests
	python-xmltodict
	licenses
)
makedepends=(git)
arch=('any')
license=('GPLv3')
source=(
	"easyepg-lite::git+https://github.com/sunsettrack4/script.service.easyepg-lite.git"
	startup.sh
	easyepg-lite.service
)
sha512sums=(
	SKIP
	0a3e72f8d284e67fcd7e530ef83f8fa45a5e32408439d872960454ae4b7357845e0a78ba882b5f75fa7d975e04c4b281fa6d0c0a1ee0d58f9eb67a64485ed73d
	64723439f8317d4e6e0dc57cbd9d3c1a18575b169125504301d67b44dc8ca5c80b3a8a097bf3e958127aee4821c59d4d14e62d0c8234601fad9c50782bdd6066
)

pkgver() {
	cd "$srcdir/easyepg-lite"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/lib/easyepg-lite"
	cp -r "$srcdir/easyepg-lite/"{main.py,resources} "$pkgdir/usr/lib/easyepg-lite"
	install -Dm0755 "$srcdir/startup.sh" "$pkgdir/usr/lib/easyepg-lite/startup.sh"
	install -Dm0644 "$srcdir/easyepg-lite.service" "$pkgdir/usr/lib/systemd/system/easyepg-lite.service"
}
