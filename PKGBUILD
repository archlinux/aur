# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

pkgname=hyx
pkgver=2020.12.24
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("a1b84fc7b4f566424292fb03b8b8bf25fe0c3cd5342efeb0894b29856394cc8350f2c3f749649e6ca345c7bf3a24ac331ba276070301102a27cd6b067daec35b")
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Pass $LDFLAGS via $CFLAGS since hyx's Makefile only considers $CFLAGS
	export CFLAGS="$CFLAGS $LDFLAGS"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
