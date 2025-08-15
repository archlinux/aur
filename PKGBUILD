# Maintainer: Andy Oknen <andy.oknen@ya.ru>

pkgbase=yggdrasil
pkgname=yggdrasil
pkgver=0.5.12
_commit=213f72b8403ff55a5e38a0fa7d1cd0a093ac4666
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
conflicts=('yggdrasil-git', 'yggdrasil-bin')
makedepends=('git' 'go')
source=("yggdrasil::git+https://github.com/yggdrasil-network/yggdrasil-go.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
	cd "${srcdir}/yggdrasil-go"
	./build
}

package() {
	cd "${srcdir}/yggdrasil-go"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/yggdrasil"
	install -Dm644 contrib/systemd/yggdrasil.service -t "${pkgdir}/usr/lib/systemd/system"
}