# Maintainer: Lukas Fink <lukas >dot< fink1 >at< gmail >dot< com>
_pkgname=openvpn-netns
pkgname="${_pkgname}-git"
pkgver=r8.82342f7
pkgrel=1
pkgdesc="A script that starts a openvpn connection inside a network namespace"
arch=('any')
url="https://github.com/pekman/openvpn-netns"
license=('Unlicense')
depends=('openvpn' 'iproute2')
optdepends=('netns-exec: for openvpn-netns-shell'
            'sudo: for openvpn-netns-shell')
makedepends=('git')
provides=('openvpn-netns')
conflicts=('openvpn-netns')
source=("${_pkgname}::git+https://github.com/pekman/openvpn-netns.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 openvpn-netns -t "$pkgdir/usr/lib/${_pkgname}"
	install -Dm755 openvpn-netns-shell -t "$pkgdir/usr/lib/${_pkgname}"
	install -Dm755 openvpn-scripts/netns -t "$pkgdir/usr/lib/${_pkgname}/openvpn-scripts"
	
	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/${_pkgname}/openvpn-netns" "$pkgdir/usr/bin/openvpn-netns"
	ln -s "/usr/lib/${_pkgname}/openvpn-netns-shell" "$pkgdir/usr/bin/openvpn-netns-shell"
}
