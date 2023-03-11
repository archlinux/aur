# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=godot
pkgname=godot3-mono-bin
pkgver=3.5.2
pkgrel=2
pkgdesc="Advanced cross-platform 2D and 3D game engine (3.X Branch Mono)"
arch=("x86_64")
url='https://godotengine.org'
license=('MIT')
depends=(libglvnd libxcursor libxi libxinerama libxrandr) # Depends() is small due to godot binary static linking libraries
optdepends=(pipewire-alsa pipewire-pulse)
source=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_x11_64.zip"
	"desktop.tar.xz") #desktop.tar.xz is taken from godot3, since the godot binary doesn't come with any files for desktop integration, nor the man pages
sha256sums=('8ef6231e2e63863a61f331177a839e5b11762e699d59ee8abbd590c57b7ffa57'
            'd65373c4d222dba3a4399ae696540b395931ce5889ac5c1e99be1fc11d63eff3')

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/opt/godot3-mono-bin"
	cp -r "${srcdir}/Godot_v${pkgver}-stable_mono_x11_64/GodotSharp" "${pkgdir}/opt/godot3-mono-bin/GodotSharp"
	cp -r "${srcdir}/Godot_v${pkgver}-stable_mono_x11_64/Godot_v${pkgver}-stable_mono_x11.64" "${pkgdir}/opt/godot3-mono-bin/Godot_v${pkgver}-stable_mono_x11.64"
	mkdir -p "${pkgdir}/usr/share" && mkdir -p "${pkgdir}/usr/bin"
	for folder in {applications,licenses,man,mime,pixmaps};
	do
		cp -r "${srcdir}/share/$folder" "${pkgdir}/usr/share/$folder"
	done

	install -Dm755 bin/godot3-mono-bin ${pkgdir}/usr/bin/godot3-mono-bin
}
