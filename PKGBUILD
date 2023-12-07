# Maintainer: LoupZeur <loup@loupzeur.net>
# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=speedify
_pkgver=14.3.3-11541
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
md5sums_x86_64=('7e53d49354a4baff050437d6c29a0828')
sha256sums_x86_64=('cd29fb99ba45fe506bd430304d8f152f000deb5ac717a70cc9e9e5b3ea1a9682')
sha512sums_x86_64=('42d2f71b72872b759d557abcc99eab316b4007f054a9dbbed65bbac0fe12d66437fce18c1b96bcf8f9ed01acfe3ce27d164e51fe0a8c7e4379c9be3020fb7c3c')
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
