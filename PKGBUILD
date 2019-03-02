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

source=("https://github.com/EliverLara/Ant/releases/download/v1.3.0/Ant-slim.tar.xz")
sha256sums=('865a759dc4dc18959b05ade9d472bca4e99fa43685c6f2e744e40e952c53254f')

package(){
	cd "$srcdir"
	tar -xvf Ant-slim.tar
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
