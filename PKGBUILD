# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=dovecot-fts-xapian
_reponame=fts-xapian
pkgver=1.4.8
pkgrel=3
epoch=1
pkgdesc="Dovecot FTS plugin based on Xapian"
arch=(x86_64)
url="https://github.com/grosjo/fts-xapian"
license=(LGPL)
depends=(dovecot xapian-core icu)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grosjo/${_reponame}/archive/${pkgver}.tar.gz")

sha256sums=('547cc87425c59d5fbb3b7f81120f0bd01dd6c78ad234d3d750c02f421804e374')

build() {
	cd "${_reponame}-${pkgver}"

	autoreconf -vi
	./configure \
		--prefix=/usr \
		--with-dovecot=/usr/lib/dovecot

	make
}

package() {
	cd "${_reponame}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
