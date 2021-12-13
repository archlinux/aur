# Maintainer: 
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname=imgv
pkgver=3.1.6
pkgrel=3
pkgdesc='A feature rich image viewer including a GUI'
url='http://imgv.sourceforge.net/'
license=(GPL)
arch=(any)
depends=(python
         python-pygame
         python-pillow)
makedepends=(dos2unix)
_archive="$pkgname-$pkgver"
source=("http://downloads.sourceforge.net/imgv/$_archive-src.tar.gz"
        imgv.profile
        imgv.sh)
sha256sums=('7dd9db8d68f772e44acb9d8e8a81fdbe346644b6834cb30aad6a06b3fec99cb3'
            'eb218e000d1e6933dedef01e3f557e5a0da21ae9817698639ea385d55e99cb3c'
            'f2be0d9ffe6e349b72ded3519201db2684762ac9291bc9a02d94b932edcb1748')

build() {
	cd "$_archive"
	dos2unix *.py data/{imgv.conf,playlists}
	sed -i 's/#\s*$//g' *.py
	sed -i 's|COLOR|#COLOR|g' "data/imgv.conf"
	sed -i 's|CACHE_DIRS|#CACHE_DIRS|g' "gl.py"
}

package() {
	install -Dm0755 imgv.profile "$pkgdir/etc/profile.d/imgv.sh"
	install -Dm0755 imgv.sh "$pkgdir/usr/bin/imgv"
	cd "$_archive"
	install -d "$pkgdir/usr/share/imgv"
	cp -r * "$pkgdir/usr/share/imgv/"
}
