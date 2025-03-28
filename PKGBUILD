# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=pomerium-bin
pkgver=0.29.1
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
            '30ba6eaa89bcdfd614623c77360810fc434514f8a04866bd205b5d994ff7fa855290ce29f27e9bd0951e9a95abb9ebdb4316fe0f2a901ad843be54fa02f73cb1')

prepare() {
	tar -xf data.tar.gz
}

package() {
	install -Dm 755 "${srcdir}/usr/sbin/pomerium" "$pkgdir/usr/bin/pomerium"
	install -Dm 644 "${srcdir}/usr/lib/systemd/system/pomerium.service" "$pkgdir/usr/lib/systemd/system/pomerium.service"
	install -Dm 644 "${srcdir}/pomerium.sysusers" "$pkgdir/usr/lib/sysusers.d/pomerium.conf"
	install -Dm 644 "${srcdir}/etc/pomerium/config.yaml" "$pkgdir/etc/pomerium/config.yaml"
}
