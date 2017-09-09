# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.0
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}-translations.patch")
sha256sums=('adf57d328f5cefdd92150da3d4b410c6a99a62fcc479b495f0769cb2fda3d2e5'
            '390cef90a1c8e41ee7bc443e079252c74088bf090d318254103854ef824cf5d7')

prepare() {
	cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np1 -i ../"${pkgname}-${pkgver}-translations.patch"
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
