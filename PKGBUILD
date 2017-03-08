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
pkgver=2.0.3
pkgrel=2
pkgdesc="Painting software"
arch=('i686' 'x86_64')
url="http://azsky2.html.xdomain.jp/linux/azpainter/index.html"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2" "ru.mtr" "en.mtr" "uk.mtr")
sha256sums=('a6b0247dd98b6275edeeb1154623e590e5bfc8baffcde7a9ab0cef7ace27ebd3'
            'f4e09e5de5fae7b94e9446b3a4ccb48e328ccc08ed4f22416d1bdb54d0111e8b'
            '3a58db606cc202dda10f85631cd365bd957d3e5bae2d34b740872ecb0cee30e9'
            '49ff02ab8eef82d93dd2d8a185080aba722bb34f9f46699268f286ecd97976b2')

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
