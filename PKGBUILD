# Maintainer: LoupZeur <loup@loupzeur.net>
# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=speedify
_pkgver=14.8.7-11988
pkgver=${_pkgver/-/.}
pkgrel=0
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
md5sums_x86_64=('f2898f6e78270a72a6c57a0db053446e')
sha256sums_x86_64=('d57fab224e6a0783e848d85c45c6a80d685a0f15912206b0e05718eecd0410dc')
sha512sums_x86_64=('821b263e0219c55570fb8a6e310392cb2edc8cbd2d8040e44f685afe71c54c9c1ec049c528a45fa81e3a9833723e73fed1e12a3ca2c708c756d3310b1b94b6f5')
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
