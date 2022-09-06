# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=minecraft-c
pkgver=1.2
_pkghash=43928d42e1f32bd76a994f0bb22c0153a7271b3f
pkgrel=1
pkgdesc="Minecraft Classic 0.0.30a reimplemented in C."
arch=(x86_64)
url="https://github.com/johnpayne-dev/MinecraftC"
license=('MIT')
depends=('sdl2' 'stb')
makedepends=('git' 'clang')
source=("${url}/archive/${_pkghash}.zip"
		"https://raw.githubusercontent.com/johnpayne-dev/cute_headers/master/cute_sound.h"
		"${pkgname}.desktop"
		"${pkgname}.png")
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
	cd "MinecraftC-${_pkghash}"
	
	cp ../cute_sound.h External/cute_headers/

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
		MinecraftC/Sound/*.c \
		MinecraftC/Utilities/*.c \
		-lm -lSDL2 -lGL -lGLU -O2 \
		-I"/usr/include/SDL2/" \
		-I"/usr/include/stb/" \
		-I"External/cute_headers/" \
		-o Output/MinecraftC
}

package() {
	install -Dm755 "${srcdir}/MinecraftC-${_pkghash}/Output/MinecraftC" "${pkgdir}/usr/bin/MinecraftC" 
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
