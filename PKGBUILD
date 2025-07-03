# Maintainer: kinker31<dp223171@gmail.com>
pkgname=helion-bin
pkgver=0.9.7.0
pkgrel=1
pkgdesc="A modern Doom FPS engine, made with C# and GPU usage in mind (pre-compiled binary version)"
arch=('x86_64')
url="https://github.com/Helion-Engine/Helion"
license=('GPL3')
# Might be a good idea investigating if we can ignore most of the dependencies or not.
depends=('openal' 'fluidsynth' 'sdl2' 'glfw' 'zmusic>=1.1.8')
conflicts=('helion-git' 'helion')
source=("https://github.com/Helion-Engine/Helion/releases/download/${pkgver}/Helion-${pkgver}-linux-x64_AOT.zip" "helion.desktop" "helion.ico")
sha256sums=('e7516c6409412c990c2e66852ce0a9521635440c6c3e50467f1f846828c2b6b4' 'dd02c430e093c2cfcdfaedfc316975af8ac47883676a05c26ac0a22a6f1b9c6b' '9590d5b920d2350a9f4ed8311f3195e619ebb168841e7d783cb652d142182c82')
package() {
	#There might be a better way of going about this, but right now this works.
	mkdir -m=644 -p "$pkgdir"/opt/Helion/SoundFonts
	install -Dm755 ./Helion "$pkgdir"/opt/Helion/
	install -Dm644 ./assets.pk3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libfluidsynth.so.3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libglfw.so.3.3 "$pkgdir"/opt/Helion/
	install -Dm644 ./libSDL2.so "$pkgdir"/opt/Helion/
	install -Dm644 ./libzmusic.so "$pkgdir"/opt/Helion/
	install -Dm644 ./README.md "$pkgdir"/opt/Helion/
	install -Dm644 ./SoundFonts/Default.sf2 "$pkgdir"/opt/Helion/SoundFonts/
	mkdir -m=644 -p "$pkgdir"/usr/share/applications/ && mkdir -m=644 -p "$pkgdir"/usr/share/icons/
	install -Dm755 "$srcdir"/helion.desktop "$pkgdir"/usr/share/applications/helion.desktop
	install -Dm755 "$srcdir"/helion.ico "$pkgdir"/usr/share/pixmaps/helion.ico
}