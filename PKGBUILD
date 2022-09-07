# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.4.6334
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=(any)
url="https://flaxengine.com"
license=('Flax EULA')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'zlib' 'libvorbis')
optdepends=('portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
provides=("thunderbird=$pkgver")
source=(https://vps2.flaxengine.com/store/builds/Package_1_04_06334/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
sha256sums=('658a7453d411f4ebc82754f5cd12cd89a6803a74ea636af19df16b8bc4c9f307' '1c8149a357f81a433412739633f50693b794fcb61780f8b507ad5a773b9a8c1f')

package() {
	cd "$srcdir"
	rm -rf "$pkgdir/opt/flax/"
	echo "Extracting Editor..."
	mkdir -p "$pkgdir/opt/flax/"
	bsdtar -xf "FlaxEditorLinux.zip" -C "$pkgdir/opt/flax"
	echo "Extracting Platform files..."
	mkdir -p "$pkgdir/opt/flax/Source/Platforms/Linux"
	bsdtar -xf "Linux.zip" -C "$pkgdir/opt/flax/Source/Platforms/Linux"
	mkdir -p "$pkgdir/usr/bin/"
	ln -sf "$pkgdir/opt/flax/Binaries/Editor/Linux/Development/FlaxEditor" "$pkgdir/usr/bin/flax"
}
