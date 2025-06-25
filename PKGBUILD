# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=bodyslide
pkgver=5.7.0
pkgrel=2
pkgdesc='BodySlide and Outfit Studio, a tool to convert, create, and customize outfits and bodies for Bethesda games.'
arch=('x86_64')

url="https://github.com/ousnius/BodySlide-and-Outfit-Studio"
license=('GPL-3.0-only')
keywords=('bethesda')
depends=('wxwidgets-gtk3'
	'glew'
)
makedepends=('cmake'
	'git'
	'gcc'
	'directx-headers'
	'fbx-sdk'
)
optdepends=('libxml2-legacy')
source=("${pkgname}::git+https://github.com/wrb2012/BodySlide-and-Outfit-Studio.git"
	'git+https://github.com/ousnius/nifly.git'
	'BodySlide.desktop'
	'OutfitStudio.desktop'
)
sha256sums=('SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	cp -rf nifly ${pkgname}/lib/
}

build() {
	cd ${pkgname}
	cmake . -B build -DCMAKE_BUILD_TYPE=Release
	make -j4 -C build
}

package() {
	install -Dm755 ${pkgname}/build/BodySlide ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 ${pkgname}/build/OutfitStudio ${pkgdir}/usr/bin/outfitstudio
	install -Dm644 BodySlide.desktop ${pkgdir}/usr/share/applications/BodySlide.desktop
	install -Dm644 OutfitStudio.desktop ${pkgdir}/usr/share/applications/OutfitStudio.desktop
	install -Dm777 ${pkgname}/Config.xml ${pkgdir}/usr/share/${pkgname}/Config.xml
        install -Dm777 ${pkgname}/BodySlide.xml ${pkgdir}/usr/share/${pkgname}/BodySlide.xml
        install -Dm777 ${pkgname}/OutfitStudio.xml ${pkgdir}/usr/share/${pkgname}/OutfitStudio.xml
	cp -r ${pkgname}/res ${pkgdir}/usr/share/${pkgname}/
	cp -r ${pkgname}/lang ${pkgdir}/usr/share/${pkgname}/
	pushd ${pkgdir}/usr/share/
	ln -s ${pkgname} outfitstudio
	chmod 777 ${pkgname}
	popd

	install -Dm644 ${pkgname}/res/images/BodySlide.png ${pkgdir}/usr/share/icons/HighContrast/256x256/apps/BodySlide.png
	install -Dm644 ${pkgname}/res/images/OutfitStudio.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/OutfitStudio.png
	install -Dm644 ${pkgname}/assets/BodySlide.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/BodySlide.svg
}
