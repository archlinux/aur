# Maintainer: hashworks <mail@hashworks.net>
pkgname=pam-ihosts
pkgver=1.5.7
pkgrel=4
pkgdesc="A PAM module that provides access control by ip, mac-address, or country-code/region"
license=("GPL3")
arch=("x86_64")
depends=("pam")
url='https://github.com/ColumPaget/pam_ihosts'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=(769f93da84f6c9b4fa7222b3d522d56ed78d536faac05fb9d267c105d1984fd4)

prepare() {
	sed -e 's|$(CFLAGS)|$(CFLAGS) $(LDFLAGS) $(CPPFLAGS)|;s| -fno-stack-protector ||' -i "pam_ihosts-${pkgver}/Makefile.in"
	sed '/$(INSTALL) -d $(DESTDIR)$(bindir)/d' -i "pam_ihosts-${pkgver}/Makefile.in"
}

build() {
	cd "pam_ihosts-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "pam_ihosts-${pkgver}"
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	make DESTDIR="${pkgdir}/" install
}
