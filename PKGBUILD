# Maintainer: Bastian Pukallus <bplinux at posteo de>

pkgname='blender-plugin-fspy'
pkgver='1.0.2'
pkgrel=1
pkgdesc="blender addon for supporting fSpy project files"
arch=('any')
url="https://github.com/stuffmatic/fSpy-Blender"
license=('GPL')
depends=()
makedepends=()
provides=()
options=()
install=
changelog=
source=("https://github.com/stuffmatic/fSpy-Blender/releases/download/v$pkgver/fSpy-Blender-$pkgver.zip")
noextract=()
sha256sums=("8449f213a52c0722b8ec0f0e844d06cac82446c26d22f9a52001e61c65e4fa16")

package() {
	_bl1="/usr/bin/blender"
	_bl2="/usr/bin/blender-2.8"
	
	if [ -e "$_bl1" ]; then
		_version=$(blender -v | head -n1 | cut -f2 -d ' ')

	elif [ -e "$_bl2" ]; then
		_version=$(blender-2.8 -v | head -n1 | cut -f2 -d ' ')
	fi
	
	_addons="$pkgdir/usr/share/blender/$_version/scripts/addons/fspy"

	cd "$srcdir/$(ls -d */)"
	
	if [ ! -d "$_addons" ]; then
    		mkdir -p "$_addons"
  	fi

	for i in *; do
		cp -r "$i" "$_addons" 
	done
}
