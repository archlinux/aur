# Maintainer: gigamicro <gammamicro@gmail.com>
_pkgver=2
_pkgname=smaz$_pkgver
pkgname="$_pkgname-git"
pkgdesc='compression for very short messages'
pkgver=2.9.g71ecc43
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/antirez/$_pkgname"
license=(MIT)
#depends=()
makedepends=(git)
provides=("$_pkgname")
source=("$_pkgname::git+$url.git" example.c)
sha256sums=(SKIP 53f34030df94040561b799d350b5540d6029d251b55f01d3ed97064fa2d06614)

pkgver() {
	printf %s.%s.g%s "$_pkgver" \
	"$(git -C "$srcdir/$_pkgname" rev-list  --count HEAD)" \
	"$(git -C "$srcdir/$_pkgname" rev-parse --short HEAD)"
}

prepare() { ln -ft "$_pkgname" example.c; }

build() { make -C "$srcdir/$_pkgname"; }

check() { "$srcdir/$_pkgname/fuzzing"; }

package() {
	install -Dvm755 -t "$pkgdir"/usr/bin/ \
	"$srcdir/$_pkgname/$_pkgname"
}
