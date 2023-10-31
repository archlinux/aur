# Maintainer: Kid <hi at xuann dot wang>

_name=replit
pkgname=$_name-desktop-app
pkgver=1.0.5
pkgrel=1
pkgdesc='The collaborative browser based IDE'
arch=(x86_64)
url=https://replit.com/desktop
license=(custom)
depends=(
	electron
)
install=.install

source=(
	$_name.deb::https://desktop.replit.com/download/deb
	$_name
)
sha256sums=('fdb60274b7b81b465d5e3d2cd6ad028c8f53d0f837745bfd1aaf2b110d7da49f'
            '9392ee9aced0cda3a50e00bc1fe40f75830388143254cbcb42929802b835d277')

package() {
	local usr="$pkgdir/usr"
	local lib="$usr/lib/$_name"

	tar --extract --file data.tar.zst --directory "$pkgdir"

	find "$lib" -type f ! -name '*.asar' -exec rm {} \;
	rmdir "$lib/locales"
	rm --recursive "$usr/share/lintian"

	install -D $_name --target-directory "$usr/bin"
}
