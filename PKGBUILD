# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor=adrelanos
pkgname=tor-ctrl
pkgver=7.4
pkgrel=1
pkgdesc="Tor control port command line tool"

arch=('x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/${pkgauthor}/${pkgname}"

makedepends=('pandoc')
depends=('bash' 'safe-rm')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${pkgver}-${pkgrel}.tar.gz")
sha256sums=('59f2af725e6fd433666854f9889b305b8b767ec02dadf770840c1b87e006dcc9')


package() {
	cd ${srcdir}/${pkgname}-${pkgver}-${pkgrel} || exit 1

	for bin in "./usr/bin/${pkgname}"*; do
		install -Dm755 ${bin} "${pkgdir}/${bin}"
	done

	install -Dm644 "./auto-generated-man-pages/${pkgname}.8" "${pkgdir}/usr/share/man/man8/${pkgname}.8"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
