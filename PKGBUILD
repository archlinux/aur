# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>

pkgname=gittyup
pkgver=1.0.0
pkgrel=0
pkgdesc='Graphical Git client (GitAhead fork)'
url="https://github.com/Murmele/${pkgname^}"
arch=(x86_64)
license=(MIT)
depends=(cmark
         libgit2
         libssh2
         org.freedesktop.secrets
         qt5-base)
makedepends=(cmake
             git
             ninja
             qt5-tools
             qt5-translations)
_archive="${pkgname^}-${pkgname}_v$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/${pkgname}_v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('63b1b68a5f1968202b423a577cc8777d52c08076abb9325a975f4b251d6734c9'
            'fb900e4d101c19a5b3e1dc4c7619780e1d38fd78d0b9d951e794fbf36eebf21a')

prepare() {
	cd "$_archive/dep"
}

build() {
	cmake \
		-G Ninja \
		-W no-dev \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_PREFIX_PATH=/usr/lib \
		-DENABLE_REPRODUCIBLE_BUILDS=ON \
		-DBUILD_SHARED_LIBS=OFF \
		-B build \
		-S "$_archive"
	ninja -C build
}

package() {
	cd "$_archive"
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.md
	# install -Dm0644 -t "$pkgdir/usr/share/applications/" "../$pkgname.desktop"
	# cmake --build ../build --target package
	# mkdir -p "$pkgdir/usr/"{share,bin}
	# cp -r "../build/_CPack_Packages/Linux/STGZ/GitAhead-$pkgver" "$pkgdir/usr/share/gitahead"
	# rm -rf "$pkgdir/usr/share/gitahead/"*.so.*
	# ln -s "/usr/share/gitahead/GitAhead" "$pkgdir/usr/bin/gitahead"
	# cd "$pkgdir/usr/share"
	# for s in 16x16 32x32 64x64 128x128 256x256 512x512; do
	#     install -Dm0644 "rsrc/Gittyup.iconset/icon_$s.png" "icons/hicolor/$s/apps/$pkgname.png"
	# done
}
