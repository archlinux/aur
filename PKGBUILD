# Maintainer: geno+dev@fireorbit.de

pkgname=clatd-git
_pkgname=clatd
_pkgauthor=toreanderson
pkgver=1.5.r0.g66e1e5f
pkgrel=1
pkgdesc="A 464XLAT CLAT implementation for Linux"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=(MIT)
depends=(tayga perl-net-ip perl-io-socket-inet6 perl-net-dns systemd)
optdepends=('NetworkManager: for dispatcher')
source=("git+https://github.com/toreanderson/clatd.git")
md5sums=(SKIP)

pkgver() {
	git -C clatd describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 clatd/clatd "${pkgdir}/usr/bin/clatd"
	install -Dm755 clatd/scripts/clatd.networkmanager "${pkgdir}/etc/NetworkManager/dispatcher.d/50-clatd"
	install -Dm644 clatd/scripts/clatd.systemd "${pkgdir}/usr/lib/systemd/system/clatd.service"
}
