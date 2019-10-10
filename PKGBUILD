# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=yggdrasil
pkgver=0.3.10
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
conflicts=('yggdrasil-git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	'yggdrasil.sysusers')
sha512sums=('1a125b64c0e7df93041989b0e0ce5b1a2e90de2a7205ed4a8c9d8e18ba043f204363966b819afc9e3f78cb995163043f54f7f98a1e6c80850c15e88a796bf741'
            'b78d1f5efeeba184588ba7bdb2249d976aec160daa59742e032983da1aedad062d15c7c97cba3eba69412a0f7904ee123d98b58f859892d71188c25624295c32')

build() {
	cd "${pkgname}-go-${pkgver}"
	PKGNAME="${pkgname}" PKGVER="${pkgver}" ./build
}

package() {
	cd "${pkgname}-go-${pkgver}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 contrib/systemd/yggdrasil.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/yggdrasil.sysusers" "${pkgdir}/usr/lib/sysusers.d/yggdrasil.conf"
}
