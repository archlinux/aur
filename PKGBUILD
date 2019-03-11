# Maintainer: Aniket-Pradhan <aniket17133@iiitd.ac.in>
# Maintainer: Kied Llaentenn <@kiedtl>
# Contributer: Michael Fogleman <michael.fogleman@gmail.com>

pkgname=craft-git
pkgver=1.0
pkgrel=1
pkgdesc="A simple Minecraft clone written in C using modern OpenGL (shaders)."
url="https://github.com/fogleman/Craft"
license=('MIT')
depends=('glew' 'xorg-server' 'curl' 'glfw')
makedepends=("cmake")
arch=("i686" "x86_64")
source=("craft-git::git+https://github.com/fogleman/Craft#branch=master"
		"launcher.sh"
		)

build() {
	cd "${srcdir}/${pkgname}"
	mkdir ${pkgname}/
	cd ${pkgname}/
	cmake ../
	make
	cp -r ../textures ./
	cp -r ../shaders ./
}

package() {
	mkdir -p ${pkgdir}/opt/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

	cp -r ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/opt/
	chown -R $USER:$USER ${pkgdir}/opt/${pkgname}

	install -Dm 755 launcher.sh ${pkgdir}/usr/bin/craft
	install -Dm644 ${srcdir}/${pkgname}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('SKIP'
            'dab424a2e7dadcbdbfac316288cab4777c17b31ca31ea639ff69799321b288046bf34d5b8d0383f6f3870beec62780cb69e08e40f5646371a624ec9e62c8f6c8')
