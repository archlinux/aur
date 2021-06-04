# Maintainer: Sabu Siyad <ssiyad at disroot dot org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=rssd
pkgver=0.3
pkgrel=1
pkgdesc="Poll and execute command when there is a new rss item"
arch=('x86_64')
url="https://github.com/ssiyad/rssd"
license=("GPL3")
makedepends=(
    "go"
    "make"
)
provides=("$pkgname")
source=(
    "$pkgname::git+$url#tag=$pkgver"
)
sha256sums=("SKIP")

build() {
    cd "$srcdir"/"$pkgname"/
    make
}

package() {
    cd "$srcdir"/"$pkgname"/
	install -Dm755 ./rssd "$pkgdir"/usr/bin/"$pkgname"
	install -Dm755 ./rssd.service "$pkgdir"/usr/lib/systemd/user/rssd.service
	install -Dm755 ./rssd.timer "$pkgdir"/usr/lib/systemd/user/rssd.timer
	install -Dm644 ./LICENSE "$pkgdir"/usr/share/licenses/common/"$pkgname"/LICENSE
}
