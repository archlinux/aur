# Maintainer: Testudo Aquatilis <testudo.aquatilis@posteo.de>
pkgname=irmpc
pkgver=1.2
pkgrel=1
epoch=
pkgdesc="Lets you control MPD via LIRC"
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/TestudoAquatilis/irmpc"
license=('GPL')
depends=('libmpdclient' 'lirc' 'glib2')
makedepends=(gcc make pkg-config)
noextract=()
source=("git+https://github.com/TestudoAquatilis/irmpc.git")
md5sums=('SKIP')
backup=("etc/irmpc/irmpc.cfg" "etc/irmpc/irmpclircrc")

build() {
	cd "${pkgname}/src"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc/irmpc"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"

	install "${srcdir}/${pkgname}/src/irmpc" "${pkgdir}/usr/bin"
	install -m 644 "${srcdir}/${pkgname}/systemd/irmpc.service" "${pkgdir}/usr/lib/systemd/system"
	install -m 644 "${srcdir}/${pkgname}/cfg/irmpc.cfg" "${pkgdir}/etc/irmpc"
	install -m 644 "${srcdir}/${pkgname}/cfg/irmpclircrc" "${pkgdir}/etc/irmpc"
}
