# Based on 'ant-gtk-theme'

pkgname=ant-slim-gtk-theme
pkgver=1.3.0
pkgrel=2
pkgdesc="Ant Slim Theme for GTK 3.x"
arch=(any)
url=https://www.gnome-look.org/p/1099856

depends=('gtk3')

_filename="Ant-Slim.tar.gz"

# Hash and Timestamp (taken from a comment on 'ant-gtk-theme')
_p="var hash = '\(.*\)';\|var timetamp = '\(.*\)';\|data-ppload-collection-id=\"\(.*\)\""
read _collectionid _hash _token <<< $(echo -n $(curl -s $url | sed -n "s/$_p/\1\2\3/p"))
_fileid="$(curl -s "https://dl.opendesktop.org/api/files/index?collection_id=$_collectionid" | grep -Po '<files_(\d+)>.*<name>'$_filename'</name>.*\/files_\1>' | sed 's/.*<id>\(.*\)<\/id>.*/\1'/)"

source=("https://dl.opendesktop.org/api/files/download/id/1550168419/s/fb9a3c1555be94027d8915783a473c0b77f3e60a2a5ce73cf728e0c79b6d8bc2e73cfa20705ff4921822a391719f7c552ea8cd965304ebb8c73d71a50f8ecf1b/t/1551506027/u//Ant-slim.tar.xz")
sha256sums=('9c1cf42c9dd6a5bf440804fb4716230dd1fa2c4d1cb99ab8e520308a6165ef8f')

package(){
	cd "$srcdir"
	tar -xvf Ant-slim.tar
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
