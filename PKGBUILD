# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=pomerium-bin
pkgver=0.32.0
pkgrel=1
pkgdesc='Identity-aware access proxy'
arch=('x86_64')
url="https://github.com/pomerium/pomerium"
license=('Apache')
provides=('pomerium')
conflicts=('pomerium')
backup=('etc/pomerium/config.yaml')
optdepends=('pomerium-cli: CLI component for interacting with server')
source=("pomerium.sysusers"
        "$pkgname-$pkgver.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_amd64.deb")
sha512sums=('1e5e7656eb5db12e0c39759ca03c463291f25e90c385105381a0e69390e98ea262615b72db73115b3d99b06f94b657ae2302b56f100be2f93f90a438fdad6833'
            '048d6eab7546605da2be6dd36948a1b2a10acf69d877585052b1d529246bb3203d9d7c88d5510ef4ed61452cfeac0a9c942522c6c8c0c9cc273e847311890398')

prepare() {
	tar -xf data.tar.gz
}

package() {
	install -Dm 755 "${srcdir}/usr/sbin/pomerium" "$pkgdir/usr/bin/pomerium"
	install -Dm 644 "${srcdir}/usr/lib/systemd/system/pomerium.service" "$pkgdir/usr/lib/systemd/system/pomerium.service"
	install -Dm 644 "${srcdir}/pomerium.sysusers" "$pkgdir/usr/lib/sysusers.d/pomerium.conf"
	install -Dm 644 "${srcdir}/etc/pomerium/config.yaml" "$pkgdir/etc/pomerium/config.yaml"
}
