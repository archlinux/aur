# Maintainer:  Joey Pabalinas <alyptik@protonmail.com>
# Contributor:  Joey Pabalinas <alyptik@protonmail.com>

pkgname=libelf_manpages-git
_pkgname="${pkgname%%-git}"
pkgver=v1.0.0
pkgrel=1
pkgdesc="Manpages for the libelf ELF access library."
arch=('any')
url="https://github.com/alyptik/libelf_manpages.git"
license=('Solaris')
options=('zipman')
source=("git://github.com/alyptik/libelf_manpages.git")
sha256sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe --tags |sed 's/-/./g'
}

prepare()
{
	cd "${srcdir}/${_pkgname}"
	# conflicts with GNU binutils
	rm -f man1/elfedit.1
}

package()
{
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}/usr/share/man/man1"
	install -d "${pkgdir}/usr/share/man/man3"
	install -m 644 -C man1/* "${pkgdir}/usr/share/man/man1/"
	install -m 644 -C man3/* "${pkgdir}/usr/share/man/man3/"
}
