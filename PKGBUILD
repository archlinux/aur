# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=yggdrasil-git
_pkgname="yggdrasil"
pkgver=0.3.12.r60.g4b16c32
_commit=4b16c325a3d90d97df208457bc35d499249f8146
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network (develop branch)"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/yggdrasil-network/yggdrasil-go"
license=('LGPLv3')
conflicts=('yggdrasil')
makedepends=('git' 'go')
source=("yggdrasil::git+https://github.com/yggdrasil-network/yggdrasil-go.git#commit=${_commit}"
	'yggdrasil.sysusers')
sha512sums=('SKIP'
            'b78d1f5efeeba184588ba7bdb2249d976aec160daa59742e032983da1aedad062d15c7c97cba3eba69412a0f7904ee123d98b58f859892d71188c25624295c32')

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
	install -Dm644 "${srcdir}/yggdrasil.sysusers" "${pkgdir}/usr/lib/sysusers.d/yggdrasil.conf"
}
