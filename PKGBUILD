# Maintainer: gigamicro <gammamicro@gmail.com>
_pkgver=2
_pkgname=smaz$_pkgver
pkgname="$_pkgname-git"
pkgdesc='compression for very small strings'
pkgver=2.9.g71ecc43
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/antirez/$_pkgname"
license=(MIT)
#depends=()
makedepends=(git)
provides=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=(SKIP)

pkgver() {
	printf %s.%s.g%s "$_pkgver" \
	"$(git -C "$srcdir/$_pkgname" rev-list  --count HEAD)" \
	"$(git -C "$srcdir/$_pkgname" rev-parse --short HEAD)"
}

build() { make -C "$srcdir/$_pkgname"; }

check() { "$srcdir/$_pkgname/fuzzing"; }

package() {
	install -Dvm755 -t "$pkgdir"/usr/bin/ \
	"$srcdir/$_pkgname/$_pkgname"
}
