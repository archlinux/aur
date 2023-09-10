# Maintainer: Walter Smuts <smuts.walter@gmail.com>
# Forked from: Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup-git
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.003001
pkgrel=1
depends=(perl git)
makedepends=(make)
optdepends=(
    'git-revise: efficiently apply fixup commits'
)
arch=(any)
source=(
	"git-autofixup::git+https://github.com/torbiak/git-autofixup.git#branch=master"
	"https://patch-diff.githubusercontent.com/raw/torbiak/git-autofixup/pull/28.patch"
)
sha256sums=(SKIP cb2694eeac647e17905fdd10bfe1a6aca1eb99b1acbccb6119b7b23653001b47)
conflicts=("git-autofixup")

build() {
	cd git-autofixup
	git apply ../28.patch
	perl Makefile.PL
}

check() {
	cd git-autofixup
	make test
}

package() {
	cd git-autofixup
	make install DESTDIR="$pkgdir"
}
