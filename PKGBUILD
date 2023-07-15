# Maintainer: éclairevoyant

_pkgname=chd
pkgname="$_pkgname-git"
pkgver=r4.94c77db
pkgrel=2
pkgdesc="Unicode-aware replacement for xxd/hexdump"
arch=(x86_64)
url="https://www.muppetlabs.com/~breadbox/software/chd.html"
license=(MIT)
depends=(glibc)
makedepends=(git)
source=("git+https://git.sr.ht/~breadbox/$_pkgname"
        $pkgname-0001-respect-compilation-flags.patch)
b2sums=('SKIP'
        '1af5926db775a0e7c2720064005d547f79819e35c33448cc349f00f9189e140804e06d260a76a9983b1855020b602a9f5ed2fce80f37c7f160b4c912e2f6be22')

prepare() {
	cd $_pkgname
	patch -Np1 -i ../$pkgname-0001-respect-compilation-flags.patch
}

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C $_pkgname
}

package() {
	cd $_pkgname
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
