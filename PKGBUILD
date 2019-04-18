# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=dovecot-fts-xapian
_reponame=fts-xapian
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="Dovecot FTS plugin based on Xapian"
arch=(x86_64)
url="https://github.com/grosjo/fts-xapian"
license=(LGPL)
depends=(dovecot xapian-core icu)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grosjo/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz")

sha256sums=('e1945ff8293c9355def79066882fc049e795ba3851e7a0066908fac197753274')

build() {
	cd "${_reponame}-${_reponame}-${pkgver}"

	autoreconf -vi
	PANDOC=false ./configure \
		--prefix=/usr \
		--with-dovecot=/usr/lib/dovecot

	make
}

package() {
	cd "${_reponame}-${_reponame}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
