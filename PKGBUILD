# Maintainer: Andy Oknen <andy.oknen@ya.ru>

pkgbase=yggdrasil-dev-git
pkgname=yggdrasil-dev-git
_pkgname=yggdrasil-go
pkgver=0.5.12
_commit=1ca92725af5f2d47bb2051801b8b4b9ed1370d19
pkgrel=1
pkgdesc="An experiment in scalable routing as an encrypted IPv6 overlay network (develop branch)"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/andyoknen/${_pkgname}"
license=('LGPLv3')
conflicts=('yggdrasil-git' 'yggdrasil-bin' 'yggdrasil')
makedepends=('git' 'go')
source=("${_pkgname}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}"
	./build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "yggdrasil" "${pkgdir}/usr/bin/yggdrasil"
	install -Dm755 "yggdrasilctl" "${pkgdir}/usr/bin/yggdrasilctl"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/yggdrasil"
	install -Dm644 contrib/systemd/yggdrasil.service -t "${pkgdir}/usr/lib/systemd/system"
}
