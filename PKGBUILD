# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=blender-plugin-poliigon
pkgver=1.5.0
pkgrel=1
epoch=
pkgdesc="The Poliigon Blender Addon puts 3,000+ models, materials and HDRIs at your fingertips. Search, download and import without leaving Blender."
arch=(x86_64)
url="https://www.poliigon.com/blender"
license=()
groups=()
depends=('blender')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://software.poliigon.com/poliigon-addon-blender.zip")
noextract=()
md5sums=('78d942bb43920cb13f485a51b091c4f8')
validpgpkeys=()

prepare() {
	cd "poliigon-addon-blender"
}

package() {
	_version="$(blender --version | head -n 1 | cut -d' ' -f2 | cut -d. -f1,2)"
	_addons="$pkgdir/usr/share/blender/$_version/scripts/addons"

	_poliigon_src="$srcdir/poliigon-addon-blender"
	_poliigon_dst="$_addons/poliigon-addon-blender"

	# Rename the update files
	for _old_filename in $(find "$_poliigon_src/files" -type f); do
		_new_filename="$(echo "$_old_filename" | sed -E 's/(.*)_update\.(.*)/\1.\2/g')"
		[[ "$_old_filename" != "$_new_filename" ]] && mv "$_old_filename" "$_new_filename"
	done;

	# Copy over all of the files
	mkdir -p "$_poliigon_dst" && cp -r "$_poliigon_src" "$(dirname "$_poliigon_dst")"
}

