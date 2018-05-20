# Based on 'ant-gtk-theme'

pkgname=ant-slim-gtk-theme
pkgver=1.1.0
pkgrel=1
pkgdesc="Ant Slim Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

_filename="Ant-Slim.tar.gz"

# Hash and Timestamp (taken from a comment on 'ant-gtk-theme')
_p="var hash = '\(.*\)';\|var timetamp = '\(.*\)';\|data-ppload-collection-id=\"\(.*\)\""
read _collectionid _hash _token <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\1\2\3/p"))
_fileid="$(curl -s "https://dl.opendesktop.org/api/files/index?collection_id=$_collectionid" | grep -Po '<files_(\d+)>.*<name>'$_filename'</name>.*\/files_\1>' | sed 's/.*<id>\(.*\)<\/id>.*/\1'/)"

source=("https://dl.opendesktop.org/api/files/downloadfile/id/$_fileid/s/$_hash/t/$_token/$_filename")
sha256sums=('3c4f359233e03b2658da380f28a051d25bffaa9f9eb556842f22e2f54f9eba7a')

package(){
	cd "$srcdir/Ant-Slim"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
