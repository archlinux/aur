# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=yggdrasil-git
_pkgname="yggdrasil"
pkgver=0.2
pkgrel=3
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
depends=('git')
makedepends=('go')
source=("yggdrasil::git+https://github.com/yggdrasil-network/yggdrasil-go.git#branch=master")
md5sums=("SKIP")

build() {
	cd "${srcdir}/${_pkgname}"
	./build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 contrib/systemd/yggdrasil.service -t "${pkgdir}/usr/lib/systemd/system"
}
