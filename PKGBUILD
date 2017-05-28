# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.0.5
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2" 
        "patch-desktop_azpainter" "patch-translation_en"
        "patch-translation_ru" "patch-translation_uk")
sha256sums=('7c3bc35fff51b3529911e5d6ce6ee2ce565694c17755fe1e6f52e6d9ad0ce839'
            '458cb04cdfcd671b10cb91d8a05f6ef5fdd7fe9cc237aba9b5796cbaa95f860d'
            'bd2dcb561bb0b15bd36c303afb18b1cbbf5d6a6cdf3e53bac64b6385f21a3c46'
            'cb81af8867e13dc265c04da3d3ea32a2bc36d90e6e2fb4faa343a8f452dcdb86'
            '22725ecf2464a5c118abe5954801aa6fc740293cc39a65f84b6836b58358b1eb')

prepare() {
	cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np0 -i ../patch-desktop_azpainter
	patch -Np0 -i ../patch-translation_en
	patch -Np0 -i ../patch-translation_ru
	patch -Np0 -i ../patch-translation_uk
	
}

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-strip
}
