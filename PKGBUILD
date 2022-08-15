pkgname=vector-bin
pkgver=0.23.3
pkgrel=1
pkgdesc='A lightweight and ultra-fast tool for building observability pipelines'
arch=('x86_64')
url="https://vector.dev"
license=('MPL')
provides=('vector')
source=("${pkgname}-${pkgver}.tar.gz::https://packages.timber.io/vector/${pkgver}/vector-${pkgver}-x86_64-unknown-linux-musl.tar.gz"
	vector.sysusers
	vector.tmpfiles)
b2sums=('3474b6c5d06907fe0918704f0f35e84aebd4e7b6c306d114f9c4563a5fe85f7c3ed46df2948aeee3a076cf2fa358b7ceb51a0173c30401f54fb3e3b0763fff50'
	'45880197e43d2a6bb9790abae1b0d2388e1c3e0f3c50f82766785becf30299e35d7674b08d0d577471944d7d2d2e7eae326ae4429dcd047a7de39ba3d48a3fa7'
	'210ddfcd6078a97ab4507054c3fb5bbea83da3048a41ba83e835f7a476cd62b77b4687284dc34a57d792fc8aacb225496f902ebcc6ddf07439df38a3311d7724')

package() {
	install -Dm644 "vector.sysusers" "$pkgdir/usr/lib/sysusers.d/vector.conf"
	install -Dm644 "vector.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/vector.conf"
	cd "${srcdir}/vector-x86_64-unknown-linux-musl"
	install -Dm755 bin/vector $pkgdir/usr/bin/vector
	install -Dm644 etc/systemd/vector.service "${pkgdir}/usr/lib/systemd/system/vector.service"
	mkdir -p $pkgdir/etc/vector
	cp -aR config/* $pkgdir/etc/vector
}
