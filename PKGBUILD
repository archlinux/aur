# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=yggdrasil
pkgver=0.2.7
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network"
arch=('aarch64' 'armv6l' 'armv7h' 'armv7l' 'i686' 'x86_64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
conflicts=('yggdrasil-git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('614551c7af176f29e219878c5b73fe10d242bd9df427e0019a1305cf46fa7b948027756b998c5e9423d2ef357e81cabfebcefb5ef39f976956ca5ac66e2aa75b')

build() {
	cd "${pkgname}-go-${pkgver}"
	./build
}

package() {
	cd "${pkgname}-go-${pkgver}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 contrib/systemd/yggdrasil.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 contrib/systemd/yggdrasil-resume.service -t "${pkgdir}/usr/lib/systemd/system"
}
