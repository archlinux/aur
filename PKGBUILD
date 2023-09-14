# Maintainer: Crawcik <crawcik@gmail.com>

pkgname=flax
pkgver=1.6.6344
pkgrel=2
pkgdesc="Flax Engine – multi-platform 3D game engine"
arch=('x86_64')
url="https://flaxengine.com"
license=('Flax EULA')
depends=('glibc' 'libx11' 'libxcursor' 'libxinerama' 'zlib' 'libvorbis' 'mono')
optdepends=('portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=(https://vps2.flaxengine.com/store/builds/Package_1_06_06344/{FlaxEditorLinux,Linux}.zip)
noextract=({FlaxEditorLinux,Linux}.zip)
conflicts=(flax-git)
sha256sums=('d903e186b5453155eec31d8af1a0619717c5d4551346a83139f4d2e63efeecd9' '759676200d521e8654530794b0b648910c20914999b5b1fa5431ffa0fc22c860')

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
