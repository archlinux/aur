# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Marvin Dalheimer <me@marvin-dalheimer.de>
_pkgname=godot
pkgname=godot-mono-bin
pkgver=4.2.2
pkgrel=3
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine"
arch=("x86_64" 'i686' 'armv7h' 'aarch64')
url='https://godotengine.org'
license=('MIT')
makedepends=('rsync')
depends=(libglvnd libxcursor libxi libxinerama libxrandr hicolor-icon-theme glibc libxrender libx11 bash libxext 'dotnet-sdk>=6.0')
optdepends=('pipewire-alsa: for audio support'
	    'pipewire-pulse: for audio support')
source=("https://github.com/godotengine/godot/archive/refs/tags/${pkgver}-stable.tar.gz")
source_x86_64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_x86_64.zip")
source_i686=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_x86_32.zip")
source_armv7h=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_arm32.zip")
source_aarch64=("https://github.com/godotengine/godot/releases/download/${pkgver}-stable/Godot_v${pkgver}-stable_mono_linux_arm64.zip")
sha256sums=('990b7b716656122364b1672508c516c898497c50216d7c00c60eeaf507685c0e')
sha256sums_x86_64=('4fe073fd99dbcdba4a8bea786b76b25a4dfee2efa6f2aa0d4f40f443d09de3f4')
sha256sums_i686=('9fa05bb03630b49761f55cdfb41b4ffe80cd1fb0110e7d0c1a9ea93d4938a7f1')
sha256sums_armv7h=('a725bacf043ec33e6fa6c4afcf4ade73bf7e97908455985c1bc8492f9a924c51')
sha256sums_aarch64=('32beab62973194f9da950d6800a7dd083b0f83547526338bcd0ba6210ee5fe68')

package() {
	cd "${srcdir}"
	mkdir -p "$pkgdir/usr/bin"
	case $arch in
	x86_64)
	install -Dm755 Godot_v${pkgver}-stable_mono_linux_x86_64/Godot_v${pkgver}-stable_mono_linux.x86_64 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_64"
	ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_64" "$pkgdir/usr/bin/godot-mono-bin"
	rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_64/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
	;;
	i686)
	install -Dm755 Godot_v${pkgver}-stable_mono_linux_x86_32/Godot_v${pkgver}-stable_mono_linux.x86_32 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_32"
	ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.x86_32" "$pkgdir/usr/bin/godot-mono-bin"
	rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_x86_32/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
	;;
	armv7h)
	install -Dm755 Godot_v${pkgver}-stable_mono_linux_arm32/Godot_v${pkgver}-stable_mono_linux.arm32 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm32"
	ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm32" "$pkgdir/usr/bin/godot-mono-bin"
	rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm32/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
	;;
	aarch64)
	install -Dm755 Godot_v${pkgver}-stable_mono_linux_arm64/Godot_v${pkgver}-stable_mono_linux.arm64 "$pkgdir/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm64"
	ln -s "/usr/lib/$pkgname/Godot_v${pkgver}-stable_mono_linux.arm64" "$pkgdir/usr/bin/godot-mono-bin"
	rsync -a -r "$srcdir/Godot_v${pkgver}-stable_mono_linux_arm64/GodotSharp" "$pkgdir/usr/lib/$pkgname/"
	;;
	esac

	cd "$srcdir/godot-$pkgver-stable"
    install -Dm644 \
        "${srcdir}/godot-${pkgver}-stable/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/LICENSE.txt" \
	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/godot.6" \
	"${pkgdir}/usr/share/man/man6/godot-mono-bin.6"

    install -Dm644 \
	"${srcdir}/godot-${pkgver}-stable/misc/dist/linux/org.godotengine.Godot.desktop"\
	"${pkgdir}/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"

    sed -i "s/Exec=godot/Exec=godot-mono-bin/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
    sed -i "s/Icon=godot/Icon=godot-mono-bin/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
    sed -i "s/Name=Godot Engine/Name=Godot Engine Mono/g" "$pkgdir/usr/share/applications/org.godotengine.Godot-mono-bin.desktop"
}
