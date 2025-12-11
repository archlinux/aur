# Maintainer: Lambda <aur@xiretza.xyz>
_pkgname=oebbwlan
pkgname=$_pkgname-git
pkgver=r12.577af78
pkgrel=1
pkgdesc="Automatically dismisses the portal page of OEBB train WLAN"
arch=(any)
url="https://github.com/Yepoleb/oebbwlan"
license=('CC-BY-4.0')
depends=('python' 'python-beautifulsoup4' 'python-requests')
makedepends=('git')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm755 -t "$pkgdir/usr/bin/" oebbwlan.py oebb-station.py
	install -Dm755 oebbnetworkmanager.py "$pkgdir/etc/NetworkManager/dispatcher.d/10-oebb"
}
