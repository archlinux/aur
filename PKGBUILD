# Maintainer: Aniket-Pradhan <aniket17133@iiitd.ac.in>
# Maintainer: Kied Llaentenn <@kiedtl>
# Contributer: Michael Fogleman <michael.fogleman@gmail.com>

pkgname=craft
pkgver=1.0
pkgrel=1
pkgdesc="A simple Minecraft clone written in C using modern OpenGL (shaders)."
url="https://github.com/fogleman/Craft"
license=('MIT')
depends=('glew' 'xorg-server' 'curl' 'glfw')
makedepends=("cmake")
arch=("i686" "x86_64")
source=("craft::git+https://github.com/fogleman/Craft#branch=master"
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

	install -Dm 755 launcher.sh ${pkgdir}/usr/bin/${pkgname}
	install -Dm644 ${srcdir}/${pkgname}/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('SKIP'
            'cf9627269bb44654dff99948c1e6ff693dd7bc7eb5aaadfbd02cc1a06f63d8c3b54ef90c3673cfcaded249201a7e522726a61aa6b83a58537d24659c0f19f329')
