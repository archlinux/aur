# Maintainer: madmurphy <madmurphy333 at gmail.com>

pkgname='proot-git'
_pkgname='proot'
_projectname='PRoot'
pkgver='r1199.0a9bbd6'
pkgrel=1
pkgdesc='chroot, mount --bind, and binfmt_misc without privilege/setup'
arch=('i686' 'x86_64')
url='http://proot.me'
license=('GPL')
provides=('proot')
conflicts=('proot' 'proot-bin')
depends=('talloc')
makedepends=('python-docutils' 'libxslt')
source=("git+https://github.com/proot-me/${_projectname}.git")
sha1sums=('SKIP')

pkgver() {

	cd "${_projectname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


build() {

	cd "${srcdir}/${_projectname}/src"
	make -f GNUmakefile

	cd "${srcdir}/${_projectname}/doc"
	make -f GNUmakefile

}

package() {

	cd "${srcdir}/${_projectname}"

	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 "src/${_pkgname}" "${pkgdir}/usr/bin"

	install -m755 -d "${pkgdir}/usr/share/man/man1/"
	install -m644 -T 'doc/proot/man.1' "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

	install -m755 -d "${pkgdir}/usr/share/doc/proot/"
	install -m644 'doc/proot/changelog.rst' "${pkgdir}/usr/share/doc/proot"
	install -m644 'doc/proot/index.html' "${pkgdir}/usr/share/doc/proot"
	install -m644 'doc/proot/manual.rst' "${pkgdir}/usr/share/doc/proot"
	install -m644 'doc/proot/roadmap.rst' "${pkgdir}/usr/share/doc/proot"

	install -m755 -d "${pkgdir}/usr/share/doc/proot/stylesheets"
	install -m644 'doc/proot/stylesheets/'* "${pkgdir}/usr/share/doc/proot/stylesheets"

}
