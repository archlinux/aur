# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.5.6338
pkgrel=1
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'zlib' 'libvorbis' 'mono')
optdepends=('portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(https://vps2.flaxengine.com/store/builds/Package_1_05_06338/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
conflicts=(flax-git)
sha256sums=('05474b3a460f1b78aa64e7a3b00b99c7d03aca0632bb0465048343033377930e' 'f34f7df613b7692b0db44aa8dc65879904f5373582d48beeb3a7acd7bc5da80d')

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
