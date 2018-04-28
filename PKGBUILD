# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.1.2
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}-${pkgver}-translations.patch")
sha256sums=('3590d9d15bfcefa6e7040ddcad95d7bf38f7d7f511ef677ab43b5413201c9810'
            '439f7d531d0ec8afcb95a0858d918a1f33c97c21fd83f87bfaf0fe26c459561b')

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
