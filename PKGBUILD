# Maintainer: Nicolas Cornu <ncornu@aldebaran-robotics.com>

pkgname=proot
_pkgname=PRoot
pkgver=5.1.0
pkgrel=2
pkgdesc="chroot, mount --bind, and binfmt_misc without privilege/setup"
arch=('i686' 'x86_64')
url="http://proot.me"
license=('GPL')
provides=('proot')
depends=('talloc')
makedepends=('python-docutils' 'libxslt')
source=(${pkgname}-v${pkgver}.tar.gz::https://github.com/cedric-vincent/${_pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('7aaffddb8f955dc1015402846768a5e755294579')

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
	install -m644 doc/proot/changelog.txt "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot/index.html "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot/manual.txt "${pkgdir}"/usr/share/doc/proot
	install -m644 doc/proot/roadmap.txt "${pkgdir}"/usr/share/doc/proot

	install -m755 -d "${pkgdir}"/usr/share/doc/proot/stylesheets
	install -m644 doc/proot/stylesheets/* "${pkgdir}"/usr/share/doc/proot/stylesheets
}

# vim: ft=sh syn=sh et
