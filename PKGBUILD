# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minecraft-c
pkgver=1.0
pkgrel=1
pkgdesc="Minecraft Classic 0.0.30a reimplemented in C."
arch=(x86_64)
url="https://github.com/johnpayne-dev/MinecraftC"
license=('MIT')
depends=('sdl2')
makedepends=('git' 'clang')
source=("${pkgname}::git+https://github.com/johnpayne-dev/MinecraftC"
		"${pkgname}.desktop"
		"${pkgname}.png")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
	cd "${pkgname}"

	# Building
	mkdir -p Output
	clang \
		MinecraftC/*.c \
		MinecraftC/GUI/*.c \
		MinecraftC/Level/*.c \
		MinecraftC/Level/Generator/*.c \
		MinecraftC/Level/Tile/*.c \
		MinecraftC/Level/Generator/Noise/*.c \
		MinecraftC/Particle/*.c \
		MinecraftC/Physics/*.c \
		MinecraftC/Player/*.c \
		MinecraftC/Render/*.c \
		MinecraftC/Render/Texture/*.c \
		MinecraftC/Utilities/*.c \
		-lm -lSDL2 -lGL -lGLU \
		-o Output/MinecraftC
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/Output/MinecraftC" "${pkgdir}/usr/bin/MinecraftC" 
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
