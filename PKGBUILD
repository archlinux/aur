# Maintainer: yuri_k7 <riyu12383@gmail.com>
# Contributor: Coelacanthus <coelacanthus@outlook.com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=onscripter
pkgver=20230825
pkgrel=1
pkgdesc="A game engine compatible to NScripter, to create and perform visual novel games"
arch=('i686' 'x86_64')
url="http://onscripter.sourceforge.jp/onscripter.html"
license=('GPL')
depends=('sdl_image'
         'sdl_mixer'
         'sdl_ttf'
         'sdl_sound'
         'lua51'
         'fontconfig'
         'libjpeg'
         'bzip2'
         'smpeg0'
         'cmake'
         'ninja'
         )
source=("http://onscripter.sourceforge.jp/${pkgname}-${pkgver}.tar.gz"
        'CMakeLists.txt'
        '0001-fix-smpeg-header-name.patch'
        '0002-fix-lua-header-name.patch'
        )

b2sums=('da6a941cba176f3ea31b68f92b075bcac0c3be91122cc5685abb13284e704b4852b33a51bcfe8af7f8c67feac39c466648fd53dd00cf87df3eebfc3611150443'
        'e9d3c5a01305868c182321c725f6b3d652ec8d1f6f2d3ef065a57bf110ce87c363ed38747a7887d30be30b26bb3d16d9c41047bffd34f6352cc3b57a9803fc66'
        '844669f2d20bfa4111b966286c60940008d42afa0eff64396cd48267cdfb4e90470d25269bdca6311e09fbd770360d1771e6ee62133563146ed0e5dcb1f459c7'
        '050d46bcac811af57ad9cec046a975abf70e01429d4517dad2cea32e1dc5d19b5b8831acbda834ef126249794a251097beaa6b34539f4e6ecac2d8522bf45222')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ln -s "${srcdir}/CMakeLists.txt"
    patch --ignore-whitespace -p1 -i "${srcdir}/0001-fix-smpeg-header-name.patch"
    patch -p1 -i "${srcdir}/0002-fix-lua-header-name.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-GNinja \
		-DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	ninja install
}
