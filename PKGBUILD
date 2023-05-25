# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.7.2
pkgrel=1
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
conflicts=(mle-git)
depends=(pcre2 lua)
makedepends=(uthash)
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('a1a29e97245e5604608039b25f8f5c2e9bb27939f795d52d61fa57e679731c06680e75b0fe0dbe80dca511899422d757da0ba73023e2ecf8d937455fa621a78a')

prepare () {
	# The Arch Linux Lua package does not have an include/lua5.4 subdir,
	# per-version subdirs are only available for the older releases; but
	# mle.h wants to use lua5.4/lua*.h nevertheless.
	ln -snf /usr/include  "${pkgname}-${pkgver}/lua5.4"
}

build () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr
}

check () {
	cd "${pkgname}-${pkgver}"
	make test
}

package () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 mle.1 "${pkgdir}/usr/share/man/man1/mle.1"
}
