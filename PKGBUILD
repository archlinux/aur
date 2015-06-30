# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=gcstatistic
pkgver=2.0.0b7
pkgrel=1
pkgdesc='Geocaching statistics tool'
arch=('i686' 'x86_64')
url='http://www.macdefender.org/products/GCStatistic/'
license=('GPL')
install=gcstatistic.install
depends_x86_86=('lib32-gcc-libs')
depends_i686=('gcc-libs')
makedepends=('imagemagick')
#source=("http://www.macdefender.org/downloads/software/GCStatistic${pkgver}L.zip"
source=("http://www.macdefender.org/downloads/software/beta/GCStatistic${pkgver}L.zip"
	'gcstatistic.png::http://macdefender.org/products/GCStatistic/index_files/ic64_gcstatistic.png'
	'gcstatistic.desktop'
	'gcstatistic')
sha256sums=('029c62841c8df2935dcd784dcb45d7b75304aa5a1850afb5842d9731f5839e1f'
            '11ed02bacb65fd7f7048f7e1e8613cf020a896a5c89476bc14f97a34c451f925'
            '1ae76c1cc8bf75f5d65a56f730caa9fe504a447b67c9549fae2465db03b4213f'
            'b5bb81bbac97846571a6d34c2e0fdb90633d1f53870d9ec693272c719bd9bf13')

prepare() {
	convert -scale 48x48 gcstatistic.png gcstatistic_48.png
}

package() {
	#cd "${srcdir}/GCStatistic${pkgver}F/"
	cd "${srcdir}/GCStatistic${pkgver}/"

	mv 'GCStatistic Libs' 'GCStatistic_Libs'
	sed -i 's/GCStatistic Libs/GCStatistic_Libs/g' GCStatistic

	for FILE in $(find -type f); do
		# no permissions here, we take it as is
		install -D ${FILE} ${pkgdir}/opt/${pkgname}/${FILE#./}
	done

	install -D -m0755 ${srcdir}/gcstatistic ${pkgdir}/usr/bin/gcstatistic

	install -D -m0644 ${srcdir}/gcstatistic.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/gcstatistic.png
	install -D -m0644 ${srcdir}/gcstatistic_48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/gcstatistic.png

	install -D -m0644 ${srcdir}/gcstatistic.desktop ${pkgdir}/usr/share/applications/gcstatistic.desktop
}

