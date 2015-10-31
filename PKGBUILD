# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: fstirlitz <felix.von.s@posteo.de>

pkgname=libxmlbird
pkgver=1.0.7
pkgrel=1
pkgdesc='XML parsing library written in Vala'
arch=('i686' 'x86_64')
url='https://birdfont.org/xmlbird.php'
license=('LGPL3')
depends=('glib2')
makedepends=('vala' 'python')
source=(https://birdfont.org/xmlbird-releases/${pkgname}-${pkgver}.tar.xz{,.sig}
        'fix_install.patch')
sha512sums=('ee407da8a63152e5427456d57724aa19ca54f2af88b5b08d26b0494160920c9d76220c5f5eb199758569b3452419de3523eacdc1fa173ac9d31968d0ffcbee39'
            'SKIP'
            '71ff8563ade1e07818a10f6296e8d12bcbbba3e5901fc849b76004be1a0e0ce01336b3193367d0a9f384b40053b9d95afdbfc198c66800f3d123d3165242887e')
validpgpkeys=('FB3BEFA59A6FF7F0E0682B68BCD31D4CCCEB9DD4') # Johan Mattsson <gmail: johan dot mattsson dot m>

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i '../fix_install.patch'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure -p /usr
	./build.py
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./install.py -d "${pkgdir}" -l /lib
}
