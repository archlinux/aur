# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>

pkgname=upspin-git
pkgver=r2313.67e250ec2
pkgrel=1
pkgdesc="A global name system of sorts."
arch=(i686 x86_64)
url="https://upspin.io"
license=('BSD')
makedepends=('go>=2:1.13' 'git')
provides=('upspin' "${pkgname%-git}")
conflicts=('upspin' "${pkgname%-git}")
source=("git+https://github.com/upspin/upspin")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/upspin"

	GOBIN="$srcdir/bin" go install -v ./cmd/...
}

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr"
	cp -a "$srcdir/bin" "$pkgdir/usr/bin"
	install -Dm0644 "$srcdir/upspin/LICENSE" "$pkgdir/usr/share/licenses/upspin/LICENSE"
}
