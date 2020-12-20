# Maintainer: oakszyjrnrdy <oakszyjrnrdy at outlook dot com>
_pkgname="gvtg_vgpu"
pkgname="$_pkgname-git"
pkgver=r6.a5bea06
pkgrel=3
pkgdesc="Systemd files to automatically create and remove gvtg vgpu"
arch=("x86_64")
url="https://github.com/oakszyjrnrdy/$_pkgname"
license=('GPL')
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/conf.d/$_pkgname")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m 644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -D -m 644 "$_pkgname" "$pkgdir/etc/conf.d/$_pkgname"
	install -D -m 755 "$_pkgname.sh" "$pkgdir/usr/lib/systemd/system-sleep/$_pkgname.sh"
}
