# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=ipfetch-git
pkgver=r10.ef082d5
pkgrel=1
pkgdesc='Neofetch like tool that can lookup IPs'
arch=(any)
url=https://github.com/trakBan/ipfetch
license=(GPL3)
depends=(python)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/\~\/\.local/\/usr/g' ipfetch
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share"
	cp -a flags "$pkgdir/usr/share/${pkgname%-git}"
	install -Dm755 ipfetch -t "$pkgdir/usr/bin"
}
