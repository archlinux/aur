# Submitter: katoh <katoh_at_mikage.ne.jp>
#
#
# translation
# -------------------
#
# pt_BR : Adriano Duarte
# ru : Eugeniy Fedirets <evgeniy_fedirets@ukr.net>, 2017 
#      Alexandre Prokoudine <alexandre.prokoudine@gmail.com>, 2017
# uk : Eugeniy Fedirets <evgeniy_fedirets@ukr.net>, 2017 

pkgname=azpainter
pkgver=2.0.4
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainter/index.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "ru.mtr" "en.mtr" "uk.mtr")
sha256sums=('6871dfe0256658424ed72675dff783863e1587a0f3a286ea3190e3cf3a2a10dd'
            'd9e05c3cee92e75c1b344372d34da261abbdd561fc0fa6cb0a664e7d041b2c6f'
            '3a58db606cc202dda10f85631cd365bd957d3e5bae2d34b740872ecb0cee30e9'
            'cfd74cc182b59a969bc3deb0b3b191dd532d824afe687023628c8d718615830e')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	# make -j1
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install-strip
	
	rm "${pkgdir}/usr/share/${pkgname}/tr/en.mtr"
	install -m644 "${srcdir}/en.mtr" "${pkgdir}/usr/share/${pkgname}/tr/en.mtr"
	install -m644 "${srcdir}/ru.mtr" "${pkgdir}/usr/share/${pkgname}/tr/ru.mtr"
	install -m644 "${srcdir}/uk.mtr" "${pkgdir}/usr/share/${pkgname}/tr/uk.mtr"
}
