# Maintainer: Tercio Martins <tecnotercio {at} yahoo {dot} com {dot} br>

pkgname=blender-plugin-syncaudio-git
pkgver=r31.f14f96c
pkgrel=1
pkgdesc="Synchronize audio strips in the Blender VSE"
arch=('i686' 'x86_64')
url="https://github.com/Joeboy/blender-addons/tree/master/syncaudio"
license=('GPLv3')
depends=('blender' 'shenidam')
makedepends=('git')
provides=('blender-plugin-syncaudio')
conflicts=('blender-plugin-syncaudio')
source=('git+https://github.com/Joeboy/blender-addons/')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/blender-addons"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/blender-addons/syncaudio"
	make
}

package() {
	_blender_version="$(blender -v | head -n1 | cut -f2 -d ' ')"
	_addons_dir="${pkgdir}/usr/share/blender/${_blender_version}/scripts/addons/"
	
	install -Dm755 "${srcdir}/blender-addons/syncaudio/syncaudio" \
		"${_addons_dir}/syncaudio/syncaudio"
	install -Dm644 "${srcdir}/blender-addons/syncaudio/__init__.py" \
		"${_addons_dir}/syncaudio/__init__.py"
	install -Dm644 "${srcdir}/blender-addons/syncaudio/LICENSE" \
		"${_addons_dir}/syncaudio/LICENSE"
	install -Dm644 "${srcdir}/blender-addons/syncaudio/README" \
		"${_addons_dir}/syncaudio/README"
}
