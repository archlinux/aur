# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=2.0.6
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azpainter/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	"${pkgname}-${pkgver}-translation.patch")
sha256sums=('f7f1c0bff9f0fe2fe6864c051a91f6e2b931c527a0e75ecde91170142163a321'
            '76eb27e3ddda16a5be6c8e5b3a4e2962ce3b73f0df98db00e4c27e2fadbc8a4e')

prepare() {
	cd ${pkgname}-${pkgver}
	# fixing translations
	
	patch -Np1 -i ../"${pkgname}-${pkgver}-translation.patch"
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
