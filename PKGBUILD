# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Todd Harbour <aur @AT@ quadronyx .DOT. org>

pkgname=wmfire2
_pkgname=wmfire
pkgver=1.2.4
pkgrel=4
pkgdesc="A WindowMaker dockapp that displays flames to monitor CPU, memory etc"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.swanson.ukfsn.org/"
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('libgtop' 'gtk2')
source=("http://www.swanson.ukfsn.org/wmfire/$_pkgname-$pkgver.tar.gz"
	gtk2.patch)
md5sums=('e0f298a542ce784806d3e8d1f555e51b'
         '9e84a18725988cc2864e7449e31a7414')

prepare() {
 cd "${srcdir}/${_pkgname}-${pkgver}"
 patch -Np2 -b -z .orig -i ../gtk2.patch
}

build() {
 cd "${srcdir}/${_pkgname}-${pkgver}"
 ./configure --prefix=/usr --mandir=/usr/share/man
 make
}

package() {
 cd "${srcdir}/${_pkgname}-${pkgver}"
 install -d "${pkgdir}/usr/bin/"
 install -d "${pkgdir}/usr/share/man/man1/"
 make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install
}
