# Maintainer: LoupZeur <loup@loupzeur.net>
# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=speedify
_pkgver=16.1.1-12801
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
md5sums_x86_64=('7df32bb33ef0530a04b8a0d0bab3f6a2')
sha256sums_x86_64=('a5cd4340a6fea9f388cb4928fefb69d36710d30f2ff368a3f492b0ab746e10b2')
sha512sums_x86_64=('7449dedd2b591b07020a82f65b47bc8b8fd7955bba058f7882716d634c26e334c45846cd9193068c94eb90dc3e7a1c9706d28c7587a785b6007335d02a457a3c')
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
