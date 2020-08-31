# Maintainer: berberman <hatsue@typed.icu>

pkgname=arch-hs-git
pkgver=r17.2ea4a7b
pkgrel=1
pkgdesc="Generating PKGBUILD for hackage packages."
arch=('x86_64')
url="https://github.com/berberman/arch-hs"
license=('MIT')
depends=('zlib' 'gmp')
makedepends=('stack' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}") 
source=(${pkgname%-git}::git+https://github.com/berberman/arch-hs.git)
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"        
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    stack build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    stack --local-bin-path "$pkgdir/usr/bin/" install
} 
