# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=phrasendrescher
pkgver="1.2.2b"
pkgrel=3
pkgdesc="A modular and multi processing pass phrase cracking tool."
arch=('i686' 'x86_64')
url="http://www.leidecker.info/projects/phrasendrescher/"
license=('BSD')
depends=('')
#optdepends=('')
makedepends=('')
_pkgname=${pkgname}
provides=("phrasendrescher")
conflicts=("pd-extended")  # "pd-extended" has nothing to do with phrasendrescher... but it uses the same binary name/path. :/
install=
changelog=
noextract=()
source=("http://www.leidecker.info/projects/phrasendrescher/phrasendrescher-${pkgver}.tar.gz"
        "phrasendrescher-${pkgver}.tar.gz.sig")
sha512sums=('ad66b3e2c26a382729dadfcb0d0eb7e430b763681fc0041a4efeed4bc070bba79688965b35fb169884352be0cd94b33a5dc90a755810b086e84c4e4e8f85e454'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
	#autoreconf
	./configure --with-plugins --prefix=${pkgdir}/usr
        make
}
package() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
	make install
	gzip --force ${srcdir}/${_pkgname}-${pkgver}/man/pd.1
        install -D -m755 ${srcdir}/${_pkgname}-${pkgver}/src/pd ${pkgdir}/usr/bin/pd
	install -d -m755 ${pkgdir}/usr/share/man/man1
	install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/man/pd.1.gz ${pkgdir}/usr/share/man/man1/
        install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/src/plugins/README ${pkgdir}/usr/share/doc/${_pkgname}/README.plugins
	install -d -m755 ${pkgdir}/usr/share/licenses/${_pkgname}
	install -D -m755 ${srcdir}/${_pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/COPYING
}
