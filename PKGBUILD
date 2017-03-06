# Maintainer: katoh <katoh_at_mikage.ne.jp>
# translation
# -------------------
#
# pt_BR : Adriano Duarte
# ru : Eugeniy Fedirets <evgeniy_fedirets@ukr.net>, 2017 
#      Alexandre Prokoudine <alexandre.prokoudine@gmail.com>, 2017
# uk : Eugeniy Fedirets <evgeniy_fedirets@ukr.net>, 2017 

pkgname=azpainter
pkgver=2.0.3
pkgrel=1
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainter/index.html"
license=('GPL3')
depends=('fontconfig' 'freetype2' 'libjpeg-turbo' 'libx11' 'libxext' 'libxft' 'libxi' 'zlib')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "ru.mtr" "en.mtr" "uk.mtr")
sha256sums=('a6b0247dd98b6275edeeb1154623e590e5bfc8baffcde7a9ab0cef7ace27ebd3'
            '8ade7f82d5be6189ba7d3e74b7eb831ca4bf5b834b49ccd3a1428eddcd1f2dac'
            '3a58db606cc202dda10f85631cd365bd957d3e5bae2d34b740872ecb0cee30e9'
            '3002eb71c2d78318982f8f539fffacbda06650756f3dd9fcf056a656ed63aa50')

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
	install -m644 "${srcdir}/ru.mtr" "${pkgdir}/usr/share/${pkgname}/tr/uk.mtr"
}
