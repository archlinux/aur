# Maintainer: Carlos Galindo < arch -at - cgj.es >
_appname=socialsharing
pkgbase=nextcloud-app-socialsharing
pkgname=('nextcloud-app-socialsharing-diaspora'
         'nextcloud-app-socialsharing-email'
         'nextcloud-app-socialsharing-facebook'
         'nextcloud-app-socialsharing-telegram'
         'nextcloud-app-socialsharing-twitter')
pkgver=2.5.0
pkgrel=1
arch=("any")
url="https://github.com/nextcloud/socialsharing"
license=('AGPL3')
depends=('nextcloud>=22' 'nextcloud<25')
makedepends=("npm" "composer")
source=("$_appname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
		"$pkgbase.patch")
sha512sums=('f49eece846ab3afe4de2da099ac57ed8e16f9587518af89a5dd9611c9dba8ca0a3bf6f6547c7ec400ddecaff17ef77934411861577e0fcf2e2c8a572713b778f'
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
