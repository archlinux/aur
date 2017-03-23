# Maintainer: Nicolas Cornu <ncornu@aldebaran-robotics.com>

pkgname='proot-3.2.1'
_pkgname='proot'
pkgver='3.2.1'
pkgrel=1
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup"
arch=('i686' 'x86_64')
url="http://proot.me"
license=('GPL')
provides=('proot')
depends=('talloc')
makedepends=('python-docutils' 'libxslt')
provides=('proot')
conflicts=('proot')
_appname='PRoot'
source=(${_pkgname}-v${pkgver}.tar.gz::https://github.com/cedric-vincent/${_appname}/archive/v${pkgver}.tar.gz)
md5sums=('0089bfebf5b4a1f298b7fdc7a032a8d8')

build() {
	cd "${srcdir}"/${_appname}-${pkgver}/src
	make -f GNUmakefile

	cd "${srcdir}"/${_appname}-${pkgver}/doc
	make -f GNUmakefile
}

package() {
	cd "${srcdir}"/${_appname}-${pkgver}

	install -m755 -d "${pkgdir}"/usr/bin
	install -m755 src/${_pkgname} "${pkgdir}"/usr/bin

	install -m755 -d "${pkgdir}"/usr/share/man/man1/
	install -m644 -T doc/${_pkgname}.1 "${pkgdir}"/usr/share/man/man1/${_pkgname}.1

	install -m755 -d "${pkgdir}"/usr/share/doc/proot/
	install -m644 doc/changelog.txt "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/index.html "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot-manual.txt "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/roadmap.txt "${pkgdir}"/usr/share/doc/proot

	install -m755 -d "${pkgdir}"/usr/share/doc/proot/stylesheets
	install -m644 doc/stylesheets/* "${pkgdir}"/usr/share/doc/proot/stylesheets
}

# vim: ft=sh syn=sh et
