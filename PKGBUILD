# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=yggdrasil
pkgver=0.3.0
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network"
arch=('aarch64' 'armv6l' 'armv7h' 'armv7l' 'i686' 'x86_64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
conflicts=('yggdrasil-git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('da674994182c73f1c89e5a01f3272d55c39d27894f4713102c8e0e3e2c288ae9fdeacf04c4c2d87b6c7380fbbe9b6eef31fca358dd1de433155cddbac0ba9581')

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
	install -Dm644 contrib/systemd/yggdrasil-resume.service -t "${pkgdir}/usr/lib/systemd/system"
}
