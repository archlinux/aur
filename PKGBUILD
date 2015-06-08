# Maintainer: nblock <nblock [/at\] archlinux DOT us
# Contributor: Gustavo Dutra <mechamo@gustavodutra.com>

pkgname=postgresql-autodoc
_pkgname=postgresql_autodoc
pkgver=1.41
pkgrel=4
pkgdesc="Translate PostgreSQL tables to HTML, Dot, Dia and DocBook XML files."
url="https://web.archive.org/web/20130712095001/http://www.rbt.ca/autodoc/index.html"
license=("3-clause BSD")
depends=('perl' 'perl-dbd-pg' 'perl-term-readkey' 'perl-html-template')
arch=('any')
source=(https://web.archive.org/web/20130712095001/http://www.rbt.ca/autodoc/binaries//${_pkgname}-${pkgver}.tar.gz)
md5sums=('a23ae4a49bfd0c14375b3ea6e04cd5b9')

build() {
	cd ${srcdir}/${_pkgname}

  # Prepare the binary, but skip the manpage since upstream
  # forgot to include manpage source (postgresql_autodoc.in)
  make -o ${_pkgname}.1 PREFIX=/usr

  # Fixup the default path in the manpage, until a proper upstream fix is available.
  sed -i -e "s|/usr/local/share/postgresql_autodoc|/usr/share/${_pkgname}|" ${_pkgname}.1
}

package() {
	cd ${srcdir}/${_pkgname}
  make -o ${_pkgname}.1 install PREFIX=/usr DESTDIR=${pkgdir}

  # Fix manpage permission
  chmod 644 ${pkgdir}/usr/share/man/man1/${_pkgname}.1
}

# vim:set ts=2 sw=2 noet:
