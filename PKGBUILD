# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot
pkgname=godot3-bin
pkgver=3.5.2
pkgrel=1
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch)"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr) # Depends() is small due to godot binary static linking libraries
optdepends=(pipewire-alsa pipewire-pulse)
provides=("godot")
conflicts=("godot")
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_x11.64.zip"
	"desktop.tar.xz") #desktop.tar.xz is taken from godot3, since the godot binary doesn't come with any files for desktop integration, nor the man pages
sha256sums=('fe2548c59e112a7495bf6a8b42b44ec19c80ea59d60208c185574bed17768044'
            '2c969b88ac07d96ad1c72b06ac5b0ce1307ebe6a6864a9885ece16b88c014805')

package() {
	cd "${srcdir}"
	install -Dm755 Godot_v$pkgver-stable_x11.64 ${pkgdir}/opt/godot3-bin/Godot_v$pkgver-stable_x11.64
	mkdir -p "${pkgdir}/usr/share" && mkdir -p "${pkgdir}/usr/bin"
	for folder in {applications,licenses,man,mime,pixmaps};
	do
		cp -r "${srcdir}/share/$folder" "${pkgdir}/usr/share/$folder"
	done

	install -Dm755 bin/godot ${pkgdir}/usr/bin/godot
}
