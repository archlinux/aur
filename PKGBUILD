# Maintainer: Thomas Voss <mail@thomasvoss.com>
pkgname=center-git
pkgver=1.0.r0.9861007
pkgrel=1
pkgdesc="Center text to standard output"
arch=('x86_64' 'i686')
url="https://git.thomasvoss.com/center"
license=('BSD')
makedepends=('git')
source=("$pkgname::git://git.thomasvoss.com/center.git")
b2sums=('SKIP')

pkgver() {
	cd $pkgname
	local tag=`git tag --sort=-v:refname | head -n1`
	printf '%s.r%s.%s' \
		`echo $tag | cut -c2-` \
		`git rev-list $tag..HEAD --count` \
		`git log --pretty=format:'%h' -n1`
}

build() {
	cd $pkgname
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
