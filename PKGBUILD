# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.5.6339
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'zlib' 'libvorbis' 'mono')
optdepends=('portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(https://vps2.flaxengine.com/store/builds/Package_1_05_06339/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
conflicts=(flax-git)
sha256sums=('f8b494389c52e99da732b9b92007deb90b7a1efa41c1c3e7597afcbd05c98215' '02af859035e3f392bafa029a30997b88b8c293bfa27c25f1bf0feb011a89a2e6')

package() {
	cd "$srcdir"
	echo "Extracting Editor..."
	mkdir -p "$pkgdir/opt/flax/"
	bsdtar -xf "FlaxEditorLinux.zip" -C "$pkgdir/opt/flax"
	echo "Extracting Platform files..."
	mkdir -p "$pkgdir/opt/flax/Source/Platforms/Linux"
	bsdtar -xf "Linux.zip" -C "$pkgdir/opt/flax/Source/Platforms/Linux"
	mkdir -p "$pkgdir/usr/bin/"
	ln -sf "/opt/flax/Binaries/Editor/Linux/Development/FlaxEditor" "$pkgdir/usr/bin/flax"
	echo "Extracting Desktop files..."
	cd "$startdir"
	bsdtar -xf "desktop_files.tar.gz" -C "$pkgdir/usr/"
	cp --no-preserve=mode,ownership ".run.sh" "$pkgdir/opt/flax/"
	chmod +x "$pkgdir/opt/flax/.run.sh"
}
