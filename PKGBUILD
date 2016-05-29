# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='gnome-keyring-import-export-hg'
pkgver=r4.a4ea7a5c5709
pkgrel=1
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, and re-importing on another machine.'
arch=('any')
url='https://bitbucket.org/spookylukey/gnome-keyring-import-export'
license=('unknown')
depends=('python2' 'pygtk' 'python2-gnomekeyring' 'python2-lxml')
makedepends=('mercurial')
provides=('gnome-keyring-import-export')
conflicts=('gnome-keyring-import-export')
source=(
	"$pkgname::hg+https://bitbucket.org/spookylukey/gnome-keyring-import-export"
	'gnome-keyring-import-export'
)
md5sums=(
	'SKIP'
	'a571895f69e34da053d62ff69530cb64'
)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r`hg identify -n | rev | sed 's/+//' | rev`.`hg identify -i | rev | sed 's/+//' | rev`"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/item_type == gnomekeyring.ITEM_NETWORK_PASSWORD/item_type = gnomekeyring.ITEM_NETWORK_PASSWORD/g' 'gnome_keyring_import_export.py'
}

package() {
	install -dm0755 "$pkgdir/usr/bin/"
	install -dm0755 "$pkgdir/usr/lib/gnome-keyring-import-export"

	cd "$srcdir"
	install -m0755 'gnome-keyring-import-export' "$pkgdir/usr/bin"

	cd "$srcdir/$pkgname"
	install -m0644 'gnome_keyring_import_export.py' "$pkgdir/usr/lib/gnome-keyring-import-export"

}
