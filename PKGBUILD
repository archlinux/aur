# SPDX-License-Identifier: APGL-3.0
# Maintainer: Dominic git at msrd0 dot de
# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=superslicer-prerelease
pkgver=2.7.61.0
_pkgtag=$pkgver
# https://github.com/supermerill/SuperSlicer/blob/2.7.61.0/deps/%2BLibBGCode/LibBGCode.cmake
_libbgcode=6f43cb004ef3d3bda37dde49f6235e24d2717629
pkgrel=1
epoch=1
pkgdesc="G-code generator for 3D printers (RepRap, Makerbot, Ultimaker etc.)"
arch=("$CARCH")
url="https://github.com/supermerill/SuperSlicer"
license=('AGPL3')
options=(!emptydirs)
depends=(
	'boost-libs'
	'cgal'
	'glew'
	'imath'
	'heatshrink'
	'libspnav'
	'nanosvg'
	'nlopt'
	'openvdb'
	'qhull>=2020.2-4'
	'slicer-udev'
	'wxwidgets-gtk3'
)
makedepends=(
	'boost'
	'cereal>=1.3.0'
	'cmake'
	'eigen'
	'libigl'
	'ninja'
	'openvdb'
)
optdepends=('superslicer-profiles: Predefined printer profiles')
provides=("superslicer=$epoch:$pkgver")
conflicts=('superslicer' 'superslicer-git')
source=("https://github.com/supermerill/SuperSlicer/archive/$_pkgtag.tar.gz"
        "https://github.com/prusa3d/libbgcode/archive/$_libbgcode.tar.gz"
        "prusaslicer-2.8.1-boost-1.87.0-asio.patch::https://bugs.gentoo.org/attachment.cgi?id=914594"
        "prusaslicer-2.8.1-cgal-6.0.patch"
        "0001-libbgcode-binarize-public-deps.patch"
        "0001-findwxwidgets.patch"
        "0002-addlib-expat.patch"
        "0003-openexr3.patch"
        "0004-fix-opencascade-version-check.patch"
        "0005-fix-opencascade-libs.patch"
        "0008-boost1.85.patch"
        "0009-fix-multiple-choice.patch"
        "0010-occtwrapper-install-dir.patch"
        "0011-fix-constructible-svgfile.patch"
        "0012-boost1.87.patch"
        "0013-fix-missing-template-args.patch")
sha512sums=('0d72bf61adcafe8eef2ed860449dc25ca295ba0732d956bff8c0ae50b381387b803fd88241ab855a9b38daf8f5eaa4c41d17241b8c15c66d63576874179aa1c0'
            '04cb7cb69d887e1fa5ced5c0219b0ee6cab81f09d1bc1226ebd26563e2ce60b85fb6e5aef11a36dffd3e00779849906fc5c19ad2cdd22d45360226912b6af31b'
            '3466fbbb00a4b9295c4c6a8fc5a983b5c5a78c7f091cd4502137301e10d0087abb50d5994ceba717a435693d8e4b6f5e4b084bd950b82ec91a33b1981d13226b'
            '188a5efa0128f848c6b3d882c2e472b3fbdd9db8c130735083b3410095197bc69dea855f4622d1011c8540cdfbfc25dc4a14e81fd28f2510067293ae5de15fce'
            'ecbe9bdec72a372dfdc25b32dee382a9937c544567fa2da42a30467ddff2594495bf244a773401f655930301a2debc94636a362383239fa08808d0e51bc687a4'
            'd910cf1fc07219b6c776240eae0f203813368e69b6a0215bcdcabba385531744093b6214b21d0dffbafa8992d3549c96bbdb02e939c52a4e81dbce98389397f9'
            '93a943eb9be52085a811d7cc8379dc5a3942befdc3d19eecf6310f8dfcfdef72bfa15dfcb85ac1f4f9d7731c973b9815a532ae444e3fe275f8f624825fe8e98b'
            '840e51b8feb3568ff46d309ece063f7188018fcaa43d19ec50ede408fdf2c237a3b7eaa11ba24409d8c3f7d6f5fb270181508cc56e0b2b0fef68b766130ef1eb'
            '8512ace14c71b04eb98532e71592447475cf7feccf1c85f376487615c8a95f6afa645e4581f577ee26d91532c57f389eac7534a875d5a24e871f3ef593af33c9'
            'a01abf748f82bc423f2c012ac430f78cfd5e56dede1d5999376e780267d0302d9a2a80c3eb15226c2f82102dda4c567c721ff99ab1fdeef504cbf9d9cb63ca53'
            'ca9f407d87d8dd0181077bc2da5a8e2f8995eed88a4787b73ee6c62ef6d2380fd1394fe5412cdc34276d4182bce6f272173e9ccb653d1e28978e16f379114002'
            '6d7ab93042a75f04e1c3c8f294d19dd39abaf22aa75caf996c6a0cf753f6472134a3d4fa443b73924800b2d3a710416a931745c168911c0df3709fb71ec00570'
            '92929ba1cb6ee104a10f34a649eba3789ca02f1725104a57412279ff68c46614b1812b13e7dcdf0d235618b9f2a868b4798b1404d9e712d9f1efd46e6c71fcb5'
            '6b677b68ebc7eda67d2f378c4d1cb5aca0a92fcecb04f685ae04aa4975655c36a606887526c4ff34b7e0b0ae2627eaf759fdeda896dffa0e0925132be36881ca'
            '559b52ed83f4032b00e2daaf22e2f86c66ce016bd4f1368f216cffed38fd5436ae12ddea427655d39c969e7de35cdcec06a0be317e58cf3d8ba1388a29664164'
            '2141359af03193ef8afe7e5cd38b03e8888dadabe58be8c9625e24572062167a10a3bf990728f16ab765cae776e834eaab88ff9c7e6a96f909a7c6ae807a1e82')

_apply_patches() {
	for patch in "${@}"
	do
		msg2 "Applying patch $patch"
		patch -Np1 -i "$patch"
	done
}

prepare() {
	cd "$srcdir/libbgcode-$_libbgcode"
	rm -rf build
	mkdir -p build

	_apply_patches \
		"$srcdir/0001-libbgcode-binarize-public-deps.patch"

	cd "$srcdir/SuperSlicer-$_pkgtag"
	rm -rf build # build fails everytime if it isn't a clean build?!?
	mkdir -p build

	# disabling tests is not enough, we need to remove them explicitly
	sed -i 's,add_subdirectory(test),,g' src/CMakeLists.txt

	# apply patches for superslicer
	_apply_patches \
		"$srcdir/prusaslicer-2.8.1-boost-1.87.0-asio.patch" \
		"$srcdir/prusaslicer-2.8.1-cgal-6.0.patch" \
		"$srcdir/0001-findwxwidgets.patch" \
		"$srcdir/0002-addlib-expat.patch" \
		"$srcdir/0003-openexr3.patch" \
		"$srcdir/0004-fix-opencascade-version-check.patch" \
		"$srcdir/0005-fix-opencascade-libs.patch" \
		"$srcdir/0008-boost1.85.patch" \
		"$srcdir/0009-fix-multiple-choice.patch" \
		"$srcdir/0010-occtwrapper-install-dir.patch" \
		"$srcdir/0011-fix-constructible-svgfile.patch" \
		"$srcdir/0012-boost1.87.patch" \
		"$srcdir/0013-fix-missing-template-args.patch"
}

build() {
	msg2 "Building libbgcode"
	cd "$srcdir/libbgcode-$_libbgcode"
	cd build

	cmake .. \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX= \
		-DLibBGCode_BUILD_CMD_TOOL=OFF \
		-DLibBGCode_BUILD_TESTS=OFF \
		-Wno-dev
	ninja
	mkdir destdir
	DESTDIR=destdir ninja install
	export "CMAKE_PREFIX_PATH=$PWD/destdir:$CMAKE_PREFIX_PATH"

	msg2 "Building SuperSlicer"
	cd "$srcdir/SuperSlicer-$_pkgtag"
	cd build

	cmake .. -DCMAKE_MESSAGE_LOG_LEVEL=DEBUG \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DOpenGL_GL_PREFERENCE=GLVND \
		-DSLIC3R_FHS=ON \
		-DSLIC3R_STATIC=OFF \
		-DSLIC3R_WX_STABLE=ON \
		-DSLIC3R_GTK=3 \
		-DSLIC3R_BUILD_TESTS=OFF \
		-DSLIC3R_ALPHA=ON \
		-Wno-dev
	ninja
}

package() {
	cd "$srcdir/SuperSlicer-$_pkgtag/build"

	DESTDIR="$pkgdir" samu install
	test ! -h "$pkgdir/usr/share/SuperSlicer/resources" || rm "$pkgdir/usr/share/SuperSlicer/resources"
	rm -r "$pkgdir/usr/lib/udev" # provided by slicer-udev
}
