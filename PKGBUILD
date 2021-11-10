# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=socialsharing
pkgbase=nextcloud-app-socialsharing
pkgname=('nextcloud-app-socialsharing-diaspora'
         'nextcloud-app-socialsharing-email'
         'nextcloud-app-socialsharing-facebook'
         'nextcloud-app-socialsharing-telegram'
         'nextcloud-app-socialsharing-twitter')
pkgver=2.3.0
pkgrel=1
arch=("any")
url="https://github.com/nextcloud/socialsharing"
license=('AGPL3')
depends=('nextcloud>=18' 'nextcloud<23')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
		"$pkgbase.patch")
sha512sums=('29d8da61111bfe4108d91a9f8c61bab7047e52b987c32d7483b521a6b8c7a0b00e9aae7f80e2264f10d9808726070255766371dff1425acf84a8799c15237ce4'
            'b9065297bc55390cb83ac5a9c07aa80321399a25fb6bd801a9e53b7e1395091f1eb35f1b493577e1d6b91d6977231ba15f3067117ce46ffa80fd41850124c85b')

prepare() {
	cd "$_appname-$pkgver"
	for i in $(ls -d socialsharing_*); do
		cd "$srcdir/$_appname-$pkgver/$i"
		patch -p1 -i "$srcdir/$pkgbase.patch" Makefile
	done
}

package_app() {
	cd "$_appname-$pkgver/${_appname}_$1"
	make appstore
	mkdir -p "$pkgdir/usr/share/webapps/nextcloud/apps"
	local _appdir="$pkgdir/usr/share/webapps/nextcloud/apps/${_appname}_$1"
	cp -a "build/artifacts/sign/${_appname}_$1" "$_appdir"
}

package_nextcloud-app-socialsharing-diaspora() {
	pkgdesc='Enable direct sharing of files via Diaspora, using shared links.'
	package_app diaspora
}

package_nextcloud-app-socialsharing-email() {
	pkgdesc='Enable direct sharing of files via email, using shared links.'
	package_app email
}

package_nextcloud-app-socialsharing-facebook() {
	pkgdesc='Enable direct sharing of files via Facebook, using shared links.'
	package_app facebook
}

package_nextcloud-app-socialsharing-telegram() {
	pkgdesc='Enable direct sharing of files via Telegram, using shared links.'
	package_app telegram
}

package_nextcloud-app-socialsharing-twitter() {
	pkgdesc='Enable direct sharing of files via Twitter, using shared links.'
	package_app twitter
}
