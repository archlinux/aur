# Maintainer: LoupZeur <loup@loupzeur.net>
# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=speedify
_pkgver=13.0.1-10802
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Use multiple internet connections in parallel"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://speedify.com/"
license=(unknown)
groups=()
depends=( lsof net-tools )
makedepends=()
provides=(speedify)
backup=()
options=()
install=
source=()
source_x86_64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_amd64.deb)
source_aarch64=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_arm64.deb)
source_armv7h=(http://apt.connectify.me/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${_pkgver}_armhf.deb)
# TODO: i386 is also supported
md5sums_x86_64=('e4b1ede444e7bd124efc658b8a827048')
sha512sums_x86_64=('2823d651d74a500a5639a04b40e52dba83f8051052e378be7d58ed5d7bae61ed2c0840fcefd00630bd949487d4b1cb0c17f851e0995afedc2cb0edfdb0e09a4d')
md5sums_aarch64=('SKIP')
md5sums_armv7h=('SKIP')

prepare() {
	cd "$srcdir"
	tar -xf "${srcdir}/data.tar.gz"
}

package() {
	cd "${srcdir}"
	cp -rp usr "${pkgdir}/usr"
	cp -rp lib "${pkgdir}/usr/lib"

	mkdir -p "${pkgdir}/etc/speedify"
	install -Dm644 usr/share/speedify/default.conf "${pkgdir}/etc/speedify/speedify.conf"
	mkdir -p "${pkgdir}/usr/bin"
	ln -fs /usr/share/speedify/speedify_cli "${pkgdir}/usr/bin/"
	ln -fs /usr/share/speedify/SpeedifyCLI.pdf "${pkgdir}/usr/share/doc/speedify/"
}
