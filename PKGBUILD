# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=pomerium-bin
pkgver=0.32.6
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
            'dff10cd8b4b0c9f94ef21c881d4c152a5aa061c3b468d751ce1e023652313df4b2fa5dd03b5d1a96d040b45af07c9997aea2c93e8d7730a4060d43af659e15a8')

prepare() {
	tar -xf data.tar.gz
}

package() {
	install -Dm 755 "${srcdir}/usr/sbin/pomerium" "$pkgdir/usr/bin/pomerium"
	install -Dm 644 "${srcdir}/usr/lib/systemd/system/pomerium.service" "$pkgdir/usr/lib/systemd/system/pomerium.service"
	install -Dm 644 "${srcdir}/pomerium.sysusers" "$pkgdir/usr/lib/sysusers.d/pomerium.conf"
	install -Dm 644 "${srcdir}/etc/pomerium/config.yaml" "$pkgdir/etc/pomerium/config.yaml"
}
