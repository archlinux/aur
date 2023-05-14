# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainer: navigaid <navigaid@gmail.com>

pkgname=proot
_pkgname=proot
pkgver=5.4.0
pkgrel=1
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup"
arch=('i686' 'x86_64')
url="https://proot-me.github.io/"
license=('GPL')
provides=('proot')
depends=('talloc')
makedepends=('python-docutils' 'libxslt')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/cedric-vincent/${_pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('29248aac2a7ce10c3bd5ee5602742ec33b2532310ff9cf73b79f3c133e5a5f68')

build() {
	cd "${srcdir}"/${_pkgname}-${pkgver}/src
	make -f GNUmakefile

	cd "${srcdir}"/${_pkgname}-${pkgver}/doc
	make -f GNUmakefile
}

package() {
	cd "${srcdir}"/${_pkgname}-${pkgver}

	install -m755 -d "${pkgdir}"/usr/bin
	install -m755 src/${pkgname} "${pkgdir}"/usr/bin

	install -m755 -d "${pkgdir}"/usr/share/man/man1/
	install -m644 -T doc/proot/man.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1

	install -m755 -d "${pkgdir}"/usr/share/doc/proot/
	install -m644 CHANGELOG.rst "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot/index.html "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot/manual.rst "${pkgdir}"/usr/share/doc/proot

	install -m755 -d "${pkgdir}"/usr/share/doc/proot/stylesheets
	install -m644 doc/proot/stylesheets/* "${pkgdir}"/usr/share/doc/proot/stylesheets
}
