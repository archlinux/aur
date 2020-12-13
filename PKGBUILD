# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Christian Zimmerer <christian(DOT)zimmerer(AT)protonmail(DOT)com>
pkgname=cyp-lukasstevens-git
pkgver=r294.3129d6f
pkgrel=1
epoch=
pkgdesc="(Check Your Proof) Checker for \"morally correct\" induction proofs about Haskell programs"
arch=(x86_64 i686)
url="https://github.com/lukasstevens/cyp"
license=(MIT)
groups=()
depends=(gmp libffi)
makedepends=(git ghc ghc-static stack)
checkdepends=()
optdepends=()
provides=(cyp)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd cyp
	( set -o pipefail
    		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 	)
}

build() {
	cd cyp
	stack build
}

check() {
	cd cyp
	stack test
}

package() {
	cd cyp
	stack install --local-bin-path $pkgdir/usr/bin
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
