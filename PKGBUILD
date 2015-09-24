# Maintainer: Pierre Neidhardt <ambrevar at gmail dot com>

_pkgname=demlo
pkgname=$_pkgname
pkgver=1.7
pkgrel=4
pkgdesc="A dynamic and extensible music library organizer"
url="http://ambrevar.bitbucket.org/$_pkgname/"
arch=('any')
license=('MIT')
depends=('ffmpeg' 'lua' 'lua-dkjson' 'lua-filesystem' 'lua-llthreads2' 'lua-penlight' 'lua-socket' 'slnunicode-git')
optdepends=('chromaprint: Internet tagging')
source=(https://bitbucket.org/ambrevar/$_pkgname/get/v$pkgver.tar.bz2)
sha1sums=('3c9d3a9c666374fbd211c450cbe5ed9394cd3cc3')

package() {
	cd "${srcdir}/ambrevar-$_pkgname-16001d6f6ef5"
	install -D -m755 $_pkgname.lua "${pkgdir}/usr/bin/$_pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -D -m644 ${_pkgname}rc "${pkgdir}/usr/share/${_pkgname}/${_pkgname}rc"

	for i in scripts/*; do
		install -D -m644 "$i" "${pkgdir}/usr/share/${_pkgname}/$i"
	done

	for i in $_pkgname/*; do
		install -D -m644 "$i" "${pkgdir}/usr/share/lua/5.3/$i"
	done

	## Man page
	install -D -m755 -d "${pkgdir}/usr/share/man/man1/"
	gzip -c $_pkgname.1 > "${pkgdir}/usr/share/man/man1/$_pkgname.1.gz" && \
		chmod 644 "${pkgdir}/usr/share/man/man1/$_pkgname.1.gz"
}
