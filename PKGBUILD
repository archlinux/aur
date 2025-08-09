# Maintainer algar
# Contributor Mr.Smith1974

pkgname=openspace-git
_pkgname=OpenSpace
pkgver=v0.20.0.542.gda029c2cbf
pkgrel=1
pkgdesc="OpenSpace is an open source, non-commercial, and freely available interactive data visualization software designed to visualize the entire known universe and portray our ongoing efforts to investigate the cosmos"
arch=('x86_64')
url="https://github.com/OpenSpace/OpenSpace"
license=('MIT')
makedepends=('cmake' 'git' 'sed' 'glm' 'websocketpp')
depends=('gdal' 'mpv' 'vulkan-headers' 'libxinerama' 'libxi' 'qt6-base' 'nss' 'at-spi2-core' 'libxcomposite' 'libxdamage' 'python-pandas')
conflicts=('openspace')
source=("git+https://github.com/OpenSpace/OpenSpace.git#branch=master"
	"open-space"
	"update-cfg.patch")
sha256sums=('SKIP'
		    56c958c21b0dc0cd2dc822f24788cd5889a222acd82407e6800b167e6c277681
		    e1309772e3c67192235ae1ca6ab48c9a9ed8a691fd964e816d2ddc875f3c616a
		    )

options=(!debug)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's/-/./g' | sed 's/\///g' | sed 's/releases//g'
}

prepare() {
	cd "${srcdir}/OpenSpace"
		git submodule update --init --recursive
		# patch main configuration file to enable local user execution.
		patch < "${srcdir}/update-cfg.patch"
}


build() {
	mkdir -p "${srcdir}/${_pkgname}/build"
	cd "${srcdir}/${_pkgname}/build"


	cmake \
	-DCMAKE_BUILD_TYPE:STRING="Release" \
	-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
	-DCMAKE_C_COMPILER:FILEPATH=/usr/bin/gcc \
	-DASSIMP_BUILD_MINIZIP=1 "${srcdir}/OpenSpace"
	
	export MAKEFLAGS="-j$(nproc)"

	make
}

package() {
	mkdir -p "$pkgdir/opt/OpenSpace/config"
	cp -R "${srcdir}/${_pkgname}/config"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/data"
	cp -R "${srcdir}/${_pkgname}/data"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/scripts"
	cp -R "${srcdir}/${_pkgname}/scripts"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/shaders"
	cp -R "${srcdir}/${_pkgname}/shaders"  "$pkgdir/opt/OpenSpace"
	mkdir -p "$pkgdir/opt/OpenSpace/documentation"
	cp -R "${srcdir}/${_pkgname}/documentation"  "$pkgdir/opt/OpenSpace"
	rm "$pkgdir/opt/OpenSpace/documentation/.gitignore"
	rm "$pkgdir/opt/OpenSpace/documentation/.git"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/atmosphere/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/atmosphere/shaders"  "$pkgdir/opt/OpenSpace/modules/atmosphere"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/base/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/base/shaders"  "$pkgdir/opt/OpenSpace/modules/base"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/cefwebgui/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/cefwebgui/shaders"  "$pkgdir/opt/OpenSpace/modules/cefwebgui"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/digitaluniverse/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/digitaluniverse/shaders"  "$pkgdir/opt/OpenSpace/modules/digitaluniverse"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/exoplanets/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/exoplanets/shaders"  "$pkgdir/opt/OpenSpace/modules/exoplanets"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/exoplanets/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/exoplanets/scripts"  "$pkgdir/opt/OpenSpace/modules/exoplanets"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/fieldlines/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/fieldlines/shaders"  "$pkgdir/opt/OpenSpace/modules/fieldlines"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/fieldlinessequence/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/fieldlinessequence/shaders"  "$pkgdir/opt/OpenSpace/modules/fieldlinessequence"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/gaia/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/gaia/shaders"  "$pkgdir/opt/OpenSpace/modules/gaia"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/gaia/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/gaia/scripts"  "$pkgdir/opt/OpenSpace/modules/gaia"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/galaxy/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/galaxy/shaders"  "$pkgdir/opt/OpenSpace/modules/galaxy"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/shaders"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/scripts"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/globebrowsing/gdal_data"
	cp -R "${srcdir}/${_pkgname}/modules/globebrowsing/gdal_data"  "$pkgdir/opt/OpenSpace/modules/globebrowsing"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/imgui/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/imgui/shaders"  "$pkgdir/opt/OpenSpace/modules/imgui"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/iswa/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/iswa/shaders"  "$pkgdir/opt/OpenSpace/modules/iswa"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/multiresvolume/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/multiresvolume/shaders"  "$pkgdir/opt/OpenSpace/modules/multiresvolume"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/skybrowser/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/skybrowser/shaders"  "$pkgdir/opt/OpenSpace/modules/skybrowser"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/space/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/space/scripts"  "$pkgdir/opt/OpenSpace/modules/space"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/space/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/space/shaders"  "$pkgdir/opt/OpenSpace/modules/space"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/spacecraftinstruments/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/spacecraftinstruments/shaders"  "$pkgdir/opt/OpenSpace/modules/spacecraftinstruments"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/touch/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/touch/shaders"  "$pkgdir/opt/OpenSpace/modules/touch"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/toyvolume/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/toyvolume/shaders"  "$pkgdir/opt/OpenSpace/modules/toyvolume"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/volume/shaders"
	cp -R "${srcdir}/${_pkgname}/modules/volume/shaders"  "$pkgdir/opt/OpenSpace/modules/volume"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/debugging/rendering"
	cp -R "${srcdir}/${_pkgname}/modules/debugging/rendering/debugshader_fs.glsl"  "$pkgdir/opt/OpenSpace/modules/debugging/rendering/debugshader_fs.glsl"
	cp -R "${srcdir}/${_pkgname}/modules/debugging/rendering/debugshader_vs.glsl"  "$pkgdir/opt/OpenSpace/modules/debugging/rendering/debugshader_vs.glsl"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/debugging/scripts"
	cp -R "${srcdir}/${_pkgname}/modules/debugging/scripts/axes.lua"  "$pkgdir/opt/OpenSpace/modules/debugging/scripts/axes.lua"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/webgui/ext/nodejs"
	cp -R "${srcdir}/${_pkgname}/modules/webgui/ext/nodejs"  "$pkgdir/opt/OpenSpace/modules/webgui/ext"
	mkdir -p "$pkgdir/opt/OpenSpace/modules/webbrowser/ext"
	cp -R "${srcdir}/${_pkgname}/build/modules/webbrowser/ext/cef/cef_binary_127.3.5+g114ea2a+chromium-127.0.6533.120_linux64/Release"  "$pkgdir/opt/OpenSpace/modules/webbrowser/ext"
	rm "$pkgdir/opt/OpenSpace/modules/webbrowser/ext/Release/libvulkan.so.1"
	mkdir -p "$pkgdir/opt/OpenSpace/bin"
	cp -R "${srcdir}/${_pkgname}/bin"  "$pkgdir/opt/OpenSpace"
	install ${srcdir}/open-space "$pkgdir/opt/OpenSpace/bin/open-space"
	mkdir -p "$pkgdir/opt/OpenSpace/lib"
	cp "${srcdir}/${_pkgname}/build/ext/ghoul/ext/lua/libLua.a" "$pkgdir/opt/OpenSpace/lib/."
	cp "${srcdir}/${_pkgname}/openspace.cfg"  "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/ACKNOWLEDGMENTS.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/CITATION.cff" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/CODE_OF_CONDUCT.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/COMMIT.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/CREDITS.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/LICENSE.md" "$pkgdir/opt/OpenSpace/."
	cp "${srcdir}/${_pkgname}/README.md" "$pkgdir/opt/OpenSpace/."
	mkdir -p "$pkgdir/opt/OpenSpace/bin/cefcache"
	chmod -R 777 "$pkgdir/opt/OpenSpace/bin/cefcache/."
}
