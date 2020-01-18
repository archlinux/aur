# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='gnome-keyring-import-export'
pkgname="$_pkgname-hg"
pkgver='r19.657ba95e254c'
pkgrel='5'
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, and re-importing on another machine - Mercurial version'
arch=('any')
url="https://bitbucket.org/spookylukey/$_pkgname"
license=('unknown')
depends=(
	# secret_storage_import_export.py
	'python' 'python-secretstorage'
	# gnome_keyring_import_export.py
	'pygtk' 'python2' 'python2-gnomekeyring' 'python2-lxml'
)
makedepends=('mercurial')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::hg+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.%s' "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 'secret_storage_import_export.py' "$pkgdir/usr/bin/secret-storage-import-export"
	install -Dm755 'gnome_keyring_import_export.py' "$pkgdir/usr/bin/gnome-keyring-import-export"
}
