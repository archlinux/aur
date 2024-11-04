# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=vblade
pkgver=25
pkgrel=3
pkgdesc="Virtual EtherDrive(R) blade AoE target"
arch=('x86_64' 'i686')
url="https://github.com/OpenAoE/vblade"
license=('GPL2')
depends=('bash')
source=("git+${url}.git#tag=vblade-${pkgver}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -d "${pkgdir}/usr/sbin"
	install -d "${pkgdir}/usr/share/man/man8"

	make prefix="${pkgdir}/usr" install

	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

	install -Dm644 ./contrib/persistence/vblade{,@}.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 ./contrib/persistence/vblade-generator -t "${pkgdir}/usr/lib/systemd/system-generators/"
	install -d "${pkgdir}/etc/vblade.conf.d"
}
