# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='gnome-keyring-import-export'
pkgname="$_pkgname-git"
pkgver='r20.g6b55065'
pkgrel='1'
pkgdesc='Simple script for exporting gnome2 (seahorse) keyrings, and re-importing on another machine - git version'
arch=('any')
url="https://github.com/spookylukey/$_pkgname"
license=('unknown')
depends=(
	# secret_storage_import_export.py
	'python' 'python-secretstorage'
	# gnome_keyring_import_export.py
	'pygtk' 'python2' 'python2-gnomekeyring' 'python2-lxml'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 'secret_storage_import_export.py' "$pkgdir/usr/bin/secret-storage-import-export"
	install -Dm755 'gnome_keyring_import_export.py' "$pkgdir/usr/bin/$_pkgname"
}
