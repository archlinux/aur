# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=pomerium-bin
pkgver=0.31.1
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
            'beded06f43bdae0b871b3c55f842cf5a2b174d7ba7b6d8e5931ae783055120fba73ef930b03a4c118e635bd1334e134debc5422f0fa7638c48e72fd75593211a')

prepare() {
	tar -xf data.tar.gz
}

package() {
	install -Dm 755 "${srcdir}/usr/sbin/pomerium" "$pkgdir/usr/bin/pomerium"
	install -Dm 644 "${srcdir}/usr/lib/systemd/system/pomerium.service" "$pkgdir/usr/lib/systemd/system/pomerium.service"
	install -Dm 644 "${srcdir}/pomerium.sysusers" "$pkgdir/usr/lib/sysusers.d/pomerium.conf"
	install -Dm 644 "${srcdir}/etc/pomerium/config.yaml" "$pkgdir/etc/pomerium/config.yaml"
}
